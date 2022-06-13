{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ViewPatterns #-}

import qualified Data.Aeson as JSON
import qualified Data.Aeson.KeyMap as KM
import Data.Binary (Binary)
import Data.Data (Typeable)
import Data.Functor ((<&>))
import Data.List (find, nub, sort)
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
  match "images/*" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "js/*" $ do
    route idRoute
    compile copyFileCompiler

  match "contact.markdown" $
    version "nav" $ do
      route $ setExtension "html"
      compile getResourceBody

  match (fromList ["contact.markdown"]) $ do
    route $ setExtension "html"
    compile $ do
      bread <- breadcrumbField ["index.html"]
      pandocCompiler
        >>= loadAndApplyTemplate "templates/default.html" (bread <> defaultContext)
        >>= relativizeUrls

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
      bread <- breadcrumbField ["index.html", "messages/index.md", thisMessage]
      pandocCompiler
        >>= loadAndApplyTemplate
          "templates/example.html"
          ( mconcat
              [ listField
                  "files"
                  ( mconcat
                      [ urlField "url",
                        field "name" (pure . view _1 . itemBody),
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
      bread <- breadcrumbField ["index.html", "messages/index.md"]
      pandocCompiler
        >>= loadAndApplyTemplate
          "templates/message.html"
          ( listField "examples" defaultContext (pure examples)
              <> defaultContext
          )
        >>= loadAndApplyTemplate "templates/default.html" (bread <> defaultContext)
        >>= relativizeUrls

  match "messages/index.md" $
    version "nav" $ do
      route $ setExtension "html"
      compile pandocCompiler

  match "messages/index.md" $ do
    route $ setExtension "html"
    compile $ do
      messages <- loadAll ("messages/*/index.md" .&&. hasNoVersion)
      bread <- breadcrumbField ["index.html"]
      let indexCtx =
            mconcat
              [ constField "title" "Messages",
                listField "messages" (messageCtx <> defaultContext) (pure messages),
                bread,
                messageTitleField,
                defaultContext
              ]

      pandocCompiler
        >>= loadAndApplyTemplate "templates/messages.html" indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

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
                defaultContext
              ]

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

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

getExampleFiles :: Compiler [Item (FilePath, Maybe (Item String), Maybe (Item String))]
getExampleFiles = do
  me <- getUnderlying
  (id, exampleName) <- case splitDirectories $ toFilePath me of
    ["messages", id, exampleName, _mdFile] -> pure (id, exampleName)
    _ -> fail "Not processing an example"

  before <- loadAll (fromGlob ("messages/" <> id <> "/" <> exampleName <> "/before/*.hs") .&&. hasVersion "raw")
  after <- loadAll (fromGlob ("messages/" <> id <> "/" <> exampleName <> "/after/*.hs") .&&. hasVersion "raw")
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
