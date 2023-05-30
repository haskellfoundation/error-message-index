{-# LANGUAGE DataKinds #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ViewPatterns #-}

import qualified Data.Aeson as JSON
import qualified Data.Aeson.KeyMap as KM
import Data.Binary (Binary)
import Data.Data (Typeable)
import Data.Foldable (for_)
import Data.Functor ((<&>))
import Data.List (find, isPrefixOf, lookup, nub, sort)
import Data.List.NonEmpty (NonEmpty (..))
import qualified Data.List.NonEmpty as NE
import qualified Data.Map.Strict as Map
import Data.Maybe (fromMaybe, listToMaybe, mapMaybe)
import Data.Monoid (mappend)
import qualified Data.Text as T
import Data.Traversable
import Hakyll
import Lens.Micro (_1, _2, _3)
import Lens.Micro.Extras (view)
import System.FilePath
import Text.Pandoc.Definition (Meta (..), MetaValue (..), Pandoc (..))

main :: IO ()
main = hakyll $ do
  -- Necessary to have GitHub Pages point at the right domain
  match "CNAME" $ do
    route idRoute
    compile copyFileCompiler

  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "js/*" $ do
    route idRoute
    compile copyFileCompiler

  for_ exampleExtensions $ \ext -> do
    match (fromGlob $ "messages/*/*/**." <> ext) $
      version "raw" $ do
        route idRoute
        compile getResourceBody

    match (fromGlob $ "messages/*/*/**." <> ext) $ do
      route idRoute
      compile copyFileCompiler

  match "messages/*/*/index.md" $
    version "nav" $ do
      route $ setExtension "html"
      compile $ getResourceBody

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
                      [ indexlessUrlField "url",
                        field "name" (pure . view _1 . itemBody),
                        -- Set the language that highlight.js should use for syntax highlighting
                        field "language" $ \(itemBody -> (filename, _, _)) ->
                          pure $ case dropWhile (== '.') $ takeExtension filename of
                            "hs" -> "haskell"
                            other -> other,
                        field "before" (maybe (pure "<not present>") (fmap itemBody . load . itemIdentifier) . view _2 . itemBody),
                        field "after" (maybe (pure "<not present>") (fmap itemBody . load . itemIdentifier) . view _3 . itemBody)
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
          ( mconcat
              [ if null examples
                  then mempty
                  else listField "examples" defaultContext (pure examples),
                flagSetFields,
                defaultContext
              ]
          )
        >>= loadAndApplyTemplate "templates/default.html" (bread <> defaultContext)
        >>= relativizeUrls

  match "messages/index.md" $ do
    route $ setExtension "html"
    compile $ makeItem $ Redirect "/"

  match "404.html" $ do
    route idRoute
    compile $ do
      bread <- breadcrumbField ["index.html"]
      let ctx = mconcat [constField "title" "Not Found", bread, defaultContext]
      getResourceBody
        >>= applyAsTemplate ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx

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
    compile getResourceBody

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------

-- | The file extensions to be shown in example lists
exampleExtensions :: NonEmpty String
exampleExtensions = "hs" :| ["yaml", "cabal"]

breadcrumbField :: [Identifier] -> Compiler (Context String)
breadcrumbField idents =
  (messageTitleField <>) . breadcrumbCtx <$> traverse (load @String . setVersion (Just "nav")) idents

breadcrumbCtx :: [Item String] -> Context String
breadcrumbCtx parents =
  listField "parents" (mconcat [indexlessUrlField "url", messageTitleField, defaultContext]) (pure parents)

indexlessUrlField :: String -> Context a
indexlessUrlField key = field key $ \i ->
  let id = itemIdentifier i
      empty' = fail $ "No route url found for item " ++ show id
   in maybe empty' (indexless . toUrl) <$> getRoute id

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
messageCtx = field "id" (pure . getId) <> indexlessUrlField "url"

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

getExampleFiles :: Compiler [Item (FilePath, Maybe (Item String), Maybe (Item String))]
getExampleFiles = do
  me <- getUnderlying
  (id, exampleName) <- case splitDirectories $ toFilePath me of
    ["messages", id, exampleName, _mdFile] -> pure (id, exampleName)
    _ -> fail "Not processing an example"

  let beforePattern =
        foldl1 (.||.) $
          exampleExtensions <&> \ext ->
            fromGlob ("messages/" <> id <> "/" <> exampleName <> "/before/*." <> ext)
      afterPattern =
        foldl1 (.||.) $
          exampleExtensions <&> \ext ->
            fromGlob ("messages/" <> id <> "/" <> exampleName <> "/after/*." <> ext)

  before <- loadAll (beforePattern .&&. hasVersion "raw")
  after <- loadAll (afterPattern .&&. hasVersion "raw")
  let allNames = sort $ nub $ map (takeFileName . toFilePath . itemIdentifier) $ before ++ after
  pure $
    [ Item
        (fromFilePath name)
        ( name,
          find ((== name) . takeFileName . toFilePath . itemIdentifier) before,
          find ((== name) . takeFileName . toFilePath . itemIdentifier) after
        )
      | name <- allNames
    ]

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
          -- Don't render flag_group field for flags which are not member of any flag group (like -Wall)
          Just (_, []) -> noResult ""
          Just (_, groups) -> return $ unwords groups
          Nothing -> return ""
    ]

indexless :: String -> String
indexless url
  | reverse toDrop `isPrefixOf` lru = reverse $ drop (length toDrop) lru
  | otherwise = url
  where
    lru = reverse url
    toDrop = "index.html"
