{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ViewPatterns #-}

import Control.Applicative (Alternative (..))
import qualified Data.Aeson as JSON
import qualified Data.Aeson.KeyMap as KM
import Data.Align (padZipWith)
import Data.Bifunctor (second)
import Data.Binary (Binary)
import Data.Data (Typeable)
import Data.Either (fromRight)
import Data.Functor ((<&>))
import Data.List (find, lookup, nub, sort)
import qualified Data.Map.Strict as Map
import Data.Maybe (fromJust, fromMaybe, isJust, listToMaybe, mapMaybe)
import Data.Monoid (mappend)
import qualified Data.Text as T
import qualified Data.Text.Lazy as LT
import Data.Traversable
import Hakyll
import Lens.Micro (_1, _2, _3)
import Lens.Micro.Extras (view)
import qualified Patience as Patience
import qualified Skylighting as Skylighting
import System.FilePath
import qualified Text.Blaze.Renderer.Text as Blaze

main :: IO ()
main = hakyll $ do
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "js/*" $ do
    route idRoute
    compile copyFileCompiler

  match "messages/*/*/**.hs" $
    version "raw" $ do
      route idRoute
      compile getResourceBody

  match "messages/*/*/**.hs" $ do
    route idRoute
    compile copyFileCompiler

  match "messages/*/*/index.md" $
    version "nav" $ do
      route $ setExtension "html"
      compile getResourceBody

  match "messages/*/*/index.md" $ do
    route $ setExtension "html"
    compile $ do
      files <- getExampleFiles
      thisMessage <-
        getUnderlying
          <&> \ident ->
            fromFilePath $ takeDirectory (takeDirectory (toFilePath ident)) </> "index.md"
      bread <- breadcrumbField ["index.html", thisMessage]
      pandocCompiler
        >>= loadAndApplyTemplate
          "templates/example.html"
          ( mconcat
              [ listField
                  "files"
                  ( mconcat
                      [ urlField "url",
                        field "diff" $ fmap itemBody . renderDiff
                      ]
                  )
                  (return files),
                defaultContext
              ]
          )
        >>= relativizeUrls

  match "messages/*/index.md" $
    version "nav" $ do
      route $ setExtension "html"
      compile pandocCompiler

  match "messages/*/index.md" $ do
    route $ setExtension "html"
    compile $ do
      examples <- getExamples
      bread <- breadcrumbField ["index.html"]
      pandocCompiler
        >>= loadAndApplyTemplate
          "templates/message.html"
          ( listField "examples" defaultContext (pure examples)
              <> flagSetFields
              <> defaultContext
          )
        >>= loadAndApplyTemplate "templates/default.html" (bread <> defaultContext)
        >>= relativizeUrls

  match "messages/index.md" $ do
    route $ setExtension "html"
    compile $ makeItem $ Redirect "/"

  match "index.html" $
    version "nav" $ do
      route idRoute
      compile getResourceBody

  match "index.html" $ do
    route idRoute
    compile $ do
      messages <- loadAll ("messages/*/index.md" .&&. hasNoVersion)
      bread <- breadcrumbField []
      let indexCtx =
            mconcat
              [ listField "messages" (messageCtx <> defaultContext) (pure messages),
                bread,
                constField "messageCount" (show (length messages)),
                defaultContext
              ]

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  -- Needed for flagInfo below
  match "warning-sets/warning-sets-9.5.txt" $ do
    compile $ getResourceBody

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------

breadcrumbField :: [Identifier] -> Compiler (Context String)
breadcrumbField idents =
  (messageTitleField <>) . breadcrumbCtx <$> traverse (load @String . setVersion (Just "nav")) idents

breadcrumbCtx :: [Item String] -> Context String
breadcrumbCtx parents =
  listField "parents" (mconcat [urlField "url", messageTitleField, defaultContext]) (pure parents)

messageTitleField :: Context String
messageTitleField = field "title" getTitle
  where
    getTitle item = do
      let ident = itemIdentifier item
      metas <- getMetadata ident
      let msgId = getIdentId ident
      case KM.lookup "title" metas of
        (Just (JSON.String (T.unpack -> str))) -> do
          pure $ maybe str ((str ++) . (" [" ++) . (++ "]")) msgId
        Just other -> fail $ "Not a string: " ++ show other
        Nothing -> pure ""

messageCtx :: Context String
messageCtx = field "id" (pure . getId)

getId :: Item a -> String
getId item = fromMaybe "" $ getIdentId (itemIdentifier item)

getIdentId :: Identifier -> Maybe String
getIdentId ident =
  case splitDirectories $ toFilePath ident of
    [_, x, _] -> Just x
    _ -> Nothing

getExamples :: Compiler [Item String]
getExamples = do
  me <- getUnderlying
  code <- case splitDirectories $ toFilePath me of
    ["messages", code, "index.md"] -> pure code
    other -> fail $ "Not processing a message: " ++ show other
  loadAll $ fromGlob ("messages/" <> code <> "/*/index.*") .&&. hasNoVersion

getExampleFiles :: Compiler [Item (FilePath, [DiffRow String])]
getExampleFiles = do
  me <- getUnderlying
  (id, exampleName) <- case splitDirectories $ toFilePath me of
    ["messages", id, exampleName, _mdFile] -> pure (id, exampleName)
    _ -> fail "Not processing an example"

  before <- loadAll (fromGlob ("messages/" <> id <> "/" <> exampleName <> "/before/*.hs") .&&. hasVersion "raw")
  after <- loadAll (fromGlob ("messages/" <> id <> "/" <> exampleName <> "/after/*.hs") .&&. hasVersion "raw")
  let allNames = sort $ nub $ map (takeFileName . toFilePath . itemIdentifier) $ before ++ after
  pure $
    [ Item (fromFilePath name) (name, diffTable)
      | name <- allNames,
        let beforeTokens = fromMaybe [] $ tokenizeHaskell . itemBody <$> findByName name before,
        let afterTokens = fromMaybe [] $ tokenizeHaskell . itemBody <$> findByName name after,
        let diffTable = map (fmap renderSourceLine) $ diffTabular beforeTokens afterTokens
    ]
  where
    findByName name = find $ (== name) . takeFileName . toFilePath . itemIdentifier

lookupBy :: (a -> Maybe b) -> [a] -> Maybe b
lookupBy f = listToMaybe . mapMaybe f

getMsgId :: Compiler (Maybe String)
getMsgId = do
  me <- getUnderlying
  case splitDirectories $ toFilePath me of
    ["messages", code] -> pure (Just code)
    ["messages", code, "index.html"] -> pure (Just code)
    ["messages", code, "index.md"] -> pure (Just code)
    _ -> pure Nothing

-- The output of ./warning-sets/warning-sets
type WarningFlagInfo = [(String, (Bool, [String]))]

flagInfo :: Compiler (Maybe (Bool, [String]))
flagInfo = do
  me <- getUnderlying
  f <- getMetadataField me "flag"
  case f of
    Nothing -> return Nothing
    Just f -> do
      -- TODO: Can we parse (and turn into a Data.Map) only once?
      lookup f . read @WarningFlagInfo <$> loadBody "warning-sets/warning-sets-9.5.txt"

flagSetFields :: Context String
flagSetFields =
  mconcat
    [ field "on_by_default" $ \_me -> do
        -- Boolean field; so return or fail
        flagInfo >>= \case
          Just (True, _) -> return ""
          _ -> noResult "",
      field "flag_group" $ \_me -> do
        flagInfo >>= \case
          Just (_, g) -> return $ unwords g
          Nothing -> return ""
    ]

-- | Break Haskell code into tokenized lines
tokenizeHaskell :: String -> [Skylighting.SourceLine]
tokenizeHaskell code =
  let haskellSyntax =
        fromJust $ Skylighting.lookupSyntax "haskell" Skylighting.defaultSyntaxMap
      tokenizerConfig =
        Skylighting.TokenizerConfig
          { Skylighting.syntaxMap = Skylighting.defaultSyntaxMap,
            Skylighting.traceOutput = False
          }
      code' = T.pack code
   in case Skylighting.tokenize tokenizerConfig haskellSyntax code' of
        Left err -> error $ "Syntax highlighting error: " ++ err
        Right srcLines -> srcLines

-- | Render a single line of syntax highlighting tokens as HTMl text
renderSourceLine :: Skylighting.SourceLine -> String
renderSourceLine line =
  LT.unpack $ Blaze.renderMarkup $ Skylighting.formatHtmlInline Skylighting.defaultFormatOpts [line]

-- let writerOptions = Pandoc.def
--     -- We make a fake Pandoc document that's just the code embedded in a code block.
--     document =
--       Pandoc.Pandoc mempty [Pandoc.CodeBlock ("", ["haskell"], []) (T.pack code)]
--  in case Pandoc.runPure $ Pandoc.writeHtml5String writerOptions document of
--       Left err -> error $ "Unexpected Pandoc error: " ++ show err
--       Right html -> T.unpack html

-- TODO: This approach is too stupid for diffing, we need to have just the lines
-- with the spans, not the enclosing code blocks.

data DiffSection a
  = -- | A stretch of text that was unchanged between the two files
    --
    -- The two arguments will likely be exactly equal, but this depends on the
    -- 'Eq' instance for 'a' used when diffing.
    Unchanged [a] [a]
  | -- | A stretch of contiguous changes between files, represented the lines that
    -- were removed and those that were added.
    Replace [a] [a]
  deriving (Show)

lineDiffToSections :: [Patience.Item a] -> [DiffSection a]
lineDiffToSections = foldr go []
  where
    go item sections@(Replace from to : rest) =
      case item of
        Patience.Old x ->
          Replace (x : from) to : rest
        Patience.New x ->
          Replace from (x : to) : rest
        otherItem ->
          newSection otherItem : sections
    go item sections@(Unchanged ls rs : rest) =
      case item of
        Patience.Both l r ->
          Unchanged (l : ls) (r : rs) : rest
        otherItem ->
          newSection otherItem : sections
    go item [] =
      [newSection item]

    newSection (Patience.Old x) = Replace [x] []
    newSection (Patience.New x) = Replace [] [x]
    newSection (Patience.Both l r) = Unchanged [l] [r]

-- diffLines :: String -> String -> [DiffSection String]
-- diffLines old new = lineDiffToSections $ Patience.diff (lines old) (lines new)

-- | A format for diffs that's easier to use in Hakyll templates.
data DiffRow a = DiffRow
  { rowChanged :: Bool,
    rowOld :: Maybe a,
    rowNew :: Maybe a
  }
  deriving (Show, Functor)

sectionsToRows :: [DiffSection a] -> [DiffRow a]
sectionsToRows =
  concatMap $ \case
    Unchanged ls rs ->
      zipWith (\l r -> DiffRow False (Just l) (Just r)) ls rs
    Replace from to ->
      padZipWith (\l r -> DiffRow True l r) from to

diffTabular :: Ord a => [a] -> [a] -> [DiffRow a]
diffTabular old new = sectionsToRows $ lineDiffToSections $ Patience.diff old new

renderDiff :: Item (FilePath, [DiffRow String]) -> Compiler (Item String)
renderDiff item@(Item ident (name, rows)) =
  loadAndApplyTemplate
    "templates/diff.html"
    ( mconcat
        [ field "name" (pure . takeFileName . toFilePath . itemIdentifier),
          listField
            "rows"
            ( mconcat
                [ boolField "changed" $ rowChanged . itemBody,
                  field "left" $ maybe empty pure . rowOld . itemBody,
                  field "right" $ maybe empty pure . rowNew . itemBody
                ]
            )
            (pure $ map (Item (setVersion (Just "diff") ident)) rows)
        ]
    )
    item
