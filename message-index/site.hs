{-# LANGUAGE DataKinds #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ViewPatterns #-}

import qualified Data.Aeson as JSON
import Data.Aeson ((.=))
import qualified Data.Aeson.KeyMap as KM
import Data.Binary (Binary)
import Data.Data (Typeable)
import Data.Foldable (for_, foldl')
import Data.Function (on)
import Data.Functor ((<&>))
import Data.List (find, lookup, nub, sort, sortBy, stripPrefix)
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
        compile getResourceBody

    match (fromGlob $ "messages/*/*/**." <> ext) $ do
      route idRoute
      compile copyFileCompiler

  match "messages/*/*/index.md" $ do
    route $ setExtension "html"
    compile $ do
      files <- getExampleFiles
      thisMessage <-
        getUnderlying
          <&> \ident ->
            fromFilePath $ takeDirectory (takeDirectory (toFilePath ident)) </> "index.md"
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

  match "messages/*/index.md" $ do
    route $ setExtension "html"
    compile $ do
      examples <- getExamples =<< getUnderlying
      let bread = breadcrumbCtx ["index.html"]
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
        >>= loadAndApplyTemplate "templates/default.html" (bread <> messageTitleField <> defaultContext)
        >>= relativizeUrls

  match "messages/index.md" $ do
    route $ setExtension "html"
    compile $ makeItem $ Redirect "/"

  match "404.html" $ do
    route idRoute
    compile $ do
      let bread = breadcrumbCtx ["index.html"]
          ctx = mconcat [constField "title" "Not Found", bread, defaultContext]
      getResourceBody
        >>= applyAsTemplate ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx

  match "index.html" $ do
    route idRoute
    compile $ do
      messages <- loadAll ("messages/*/index.md" .&&. hasNoVersion)
      let bread = breadcrumbCtx []
          indexCtx =
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

  create ["api/errors.json"] $ do
    route idRoute
    compile $ do
      let exampleItemToJSON :: Item String -> Compiler JSON.Value
          exampleItemToJSON exampleItem = do
            meta <- getMetadata (itemIdentifier exampleItem)
            route <- getRoute (itemIdentifier exampleItem)
            let name =
                  case splitDirectories $ toFilePath $ itemIdentifier exampleItem of
                    ["messages", _, name, "index.md"] -> name
                    other -> error "is not an example"
            pure $ JSON.object
              [ "name" .= name
              , "route" .= route
              , "metadata" .= meta
              ]

      let errorItemToJSON :: Item String -> Compiler JSON.Value
          errorItemToJSON errorItem = do
            meta <- getMetadata (itemIdentifier errorItem)
            route <- getRoute (itemIdentifier errorItem)
            let code =
                  case splitDirectories (toFilePath (itemIdentifier errorItem)) of
                    ["messages", code, "index.md"] -> code
                    other -> error "is not a message"
            exampleItems <- getExamples (itemIdentifier errorItem)
            examples <- traverse exampleItemToJSON exampleItems
            pure $ JSON.object
              [ "code" .= code
              , "route" .= route
              , "metadata" .= meta
              , "examples" .= examples
              ]

      errorItems <- loadAll $ "messages/*/index.md" .&&. hasNoVersion
      encoded <- traverse errorItemToJSON errorItems
      makeItem $ JSON.encode encoded


--------------------------------------------------------------------------------

-- | The file extensions to be shown in example lists
exampleExtensions :: NonEmpty String
exampleExtensions = "hs" :| ["yaml", "cabal"]

breadcrumbCtx :: [Identifier] -> Context String
breadcrumbCtx parents =
  let parents' = (`Item` ()) <$> parents
   in listField "parents" (indexlessUrlField "url" <> messageTitleField) (pure parents')

indexlessUrlField :: String -> Context a
indexlessUrlField = mapContext indexless . urlField

messageTitleField :: Context a
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

data ExampleOrder = InGroup Integer | Last
  deriving (Eq, Show)

instance Ord ExampleOrder where
  compare (InGroup i) (InGroup j) = compare i j
  compare (InGroup _) Last = LT
  compare Last (InGroup _) = GT
  compare Last Last = EQ

getExampleOrder :: Identifier -> Compiler ExampleOrder
getExampleOrder ident = do
  metas <- getMetadata ident
  let msgId = getIdentId ident
  case KM.lookup "order" metas of
    (Just (JSON.Number i)) -> pure $ InGroup (truncate i)
    Just other -> fail $ "Not an integer: " ++ show other
    Nothing -> pure Last

getId :: Item a -> String
getId item = fromMaybe "" $ getIdentId (itemIdentifier item)

getIdentId :: Identifier -> Maybe String
getIdentId ident =
  case splitDirectories $ toFilePath ident of
    [_, x, _] -> Just x
    _ -> Nothing

getExamples :: Identifier -> Compiler [Item String]
getExamples me = do
  code <- case splitDirectories $ toFilePath me of
    ["messages", code, "index.md"] -> pure code
    other -> fail $ "Not processing a message: " ++ show other
  items <- loadAll $ fromGlob ("messages/" <> code <> "/*/index.*") .&&. hasNoVersion
  sortByM (getExampleOrder . itemIdentifier) items
  where
    sortByM :: (Monad m, Ord b) => (a -> m b) -> [a] -> m [a]
    sortByM f = fmap (map fst . sortBy (compare `on` snd)) . mapM (\x -> (x,) <$> f x)

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
indexless url = fromMaybe url (stripSuffix "index.html" url)

stripSuffix :: String -> String -> Maybe String
stripSuffix suffix src = reverse <$> stripPrefix (reverse suffix) (reverse src)
