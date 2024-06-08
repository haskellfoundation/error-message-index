#!/usr/bin/env cabal
{- cabal:
build-depends: base, haskeline, directory, filepath
-}
module Main where

import Control.Monad (forM, forM_)
import Control.Monad.IO.Class (liftIO)
import Data.Char (isLower, isSpace, toLower, toUpper)
import System.Directory (createDirectory, createDirectoryIfMissing)
import System.FilePath ((<.>), (</>))
import System.Console.Haskeline
import System.IO (BufferMode (..), hSetBuffering, stdout)
import Text.Read (readMaybe)

type ToolM a = InputT IO a

getInputLine' :: String -> ToolM String
getInputLine' s = do
  ln <- getInputLine s
  pure (maybe "" id ln)

-------------------------------------------------------------------------------
-- Querying the user about the diagnostic
-------------------------------------------------------------------------------

-- | Remove leading and trailing whitespace, and convert to lower case.
normalize :: String -> String
normalize = fmap toLower . strip
  where
    strip = f . f
    f = reverse . dropWhile isSpace

-- Querying for the tool: GHC / GHCup / Stack

data Tool = GHC | GHCup | Stack | Cabal deriving (Show)

readTool :: ToolM Tool
readTool = do
  outputStrLn "· Which tool's error code do you want to document?"
  outputStrLn " 1) GHC"
  outputStrLn " 2) GHCup"
  outputStrLn " 3) Stack"
  outputStrLn " 4) Cabal"
  ln <- getInputLine' "Input (Default = GHC): "
  case normalize ln of
    "1" -> pure GHC
    "ghc" -> pure GHC
    "2" -> pure GHCup
    "ghcup" -> pure GHCup
    "3" -> pure Stack
    "stack" -> pure Stack
    "4" -> pure Cabal
    "cabal" -> pure Cabal
    "" -> pure GHC
    _ -> do
      outputStrLn "Didn't understand input. Please type a tool name or a number."
      readTool

-- Querying for the error code

-- | We need to encode the error code as a string in order
--   to preserve leading 0's.
type ErrorCode = String

readCode :: ToolM ErrorCode
readCode = do
  outputStrLn "· What is the numeric code that you want to document?"
  outputStrLn "For example, enter \"01234\" if you want to document GHC-01234."
  ln <- getInputLine' "Input: "
  case readMaybe ln :: Maybe Int of
    Nothing -> do
      outputStrLn "Could not parse the input as an integer. Only enter the numeric part of the error."
      readCode
    Just _ -> pure ln

-- Title
type Title = String

readTitle :: ToolM Title
readTitle = do
  outputStrLn "· What is the title of the error message?"
  outputStrLn "This is used as the title of the documentation page as well as in links to the page."
  getInputLine' "Input: "

-- Summary
type Summary = String

readSummary :: ToolM Summary
readSummary = do
  outputStrLn "· Give a short summary of the error message."
  outputStrLn "This appears on the overview page that lists all the documented errors and warnings."
  getInputLine' "Input: "

-- Severity
data Severity = Error | Warning deriving (Show)

readSeverity :: ToolM Severity
readSeverity = do
  outputStrLn "· What is the severity of the diagnostic?"
  outputStrLn " 1) Error"
  outputStrLn " 2) Warning"
  ln <- getInputLine' "Input (Default = Error): "
  case normalize ln of
    "1" -> pure Error
    "error" -> pure Error
    "2" -> pure Warning
    "warning" -> pure Warning
    "" -> pure Error
    _ -> do
      outputStrLn "Please type \"error\" or \"warning\" or a number."
      readSeverity

-- Warning flag
type WarningFlag = String

-- | Only ask for a warning flag if Severity = Warning.
readWarningFlag :: Severity -> ToolM (Maybe WarningFlag)
readWarningFlag Warning = do
  outputStrLn "· What is the warning flag which enables this warning?"
  outputStrLn "For example, enter \"-Wtabs\" if you are documenting GHC's warning about tabs in your source file."
  outputStrLn "You can leave this blank if you're not sure."
  Just <$> getInputLine' "Input: "
readWarningFlag _ = pure Nothing

-- Version
type Version = String

readVersion :: ToolM Version
readVersion = do
  outputStrLn "· Which version of the tool emitted the numeric code (not the message) for the first time?"
  outputStrLn "Note: For GHC this is most likely 9.6.1."
  getInputLine' "Input: "

-- Examples
type Examples = [String]

validateExampleName :: String -> Bool
validateExampleName "" = False
validateExampleName str@(s : _) = not (any isSpace str) && isLower s

-- | Only ask for examples if the system is GHC.
readExamples :: Tool -> ToolM Examples
readExamples GHC = do
  outputStrLn "· How many examples should be generated?"
  ln <- getInputLine' "Input: "
  case readMaybe ln :: Maybe Int of
    Nothing -> pure []
    Just n -> forM [1 .. n] readExample
readExamples _ = pure []

readExample :: Int -> ToolM String
readExample i = do
  outputStrLn ""
  outputStrLn ("· Give a name for example " <> show i)
  outputStrLn "The name should not contain spaces and begin with a lowercase letter."
  ln <- getInputLine' "Input: "
  if validateExampleName ln then pure ln else readExample i

-- Template
data Template = MkTemplate
  { tool :: Tool,
    code :: ErrorCode,
    title :: Title,
    summary :: Summary,
    severity :: Severity,
    warningflag :: Maybe WarningFlag,
    introduced :: Version,
    examples :: Examples
  }
  deriving (Show)

readTemplate :: ToolM Template
readTemplate = do
  outputStrLn "This tool helps you create the scaffolding for a new error message on the error-message-index."
  outputStrLn "You can leave any of the text fields blank and fill them in by hand later."
  outputStrLn ""
  sys <- readTool
  outputStrLn ""
  code <- readCode
  outputStrLn ""
  title <- readTitle
  outputStrLn ""
  summary <- readSummary
  outputStrLn ""
  severity <- readSeverity
  outputStrLn ""
  warningflag <- readWarningFlag severity
  outputStrLn ""
  version <- readVersion
  outputStrLn ""
  examples <- readExamples sys
  pure (MkTemplate sys code title summary severity warningflag version examples)

-------------------------------------------------------------------------------
-- Creating the files and directories from the template
-------------------------------------------------------------------------------

createFiles :: Template -> IO ()
createFiles tmpl = liftIO $ do
  putStrLn ""
  putStrLn "· Creating scaffolding..."

  -- Create the new directory "messages/XXX-NNNNNN/" and "messages/XXX-NNNNNN/index.md"
  let message_dir = "messages" </> case tool tmpl of { GHC -> "GHC-"; GHCup -> "GHCup-"; Stack -> "S-"; Cabal -> "Cabal-" } ++ code tmpl
  createDirectoryIfMissing True message_dir
  let index_filename = message_dir </> "index.md"
  let toplvl_index =
        unlines $
          [ "---",
            "title: " <> title tmpl,
            "summary: " <> summary tmpl,
            "severity: " <> case severity tmpl of Warning -> "warning"; Error -> "error"
          ]
            <> (case warningflag tmpl of Nothing -> []; Just flg -> ["flag: " <> flg])
            <> [ "introduced: " <> introduced tmpl,
                 "---",
                 "",
                 "Insert your error message here."
               ]
  writeFile index_filename toplvl_index
  putStrLn ("·· Created file " <> index_filename <> " with these contents:")
  putStrLn ""
  putStr toplvl_index

  -- Create the example directories and entries:
  -- - "messages/XXX-NNNNNN/" and "messages/XXX-NNNNNN/example-name/index.md"
  -- - "messages/XXX-NNNNNN/example-name/before/" and "messages/XXX-NNNNNN/example-name/before/Module.hs"
  -- - "messages/XXX-NNNNNN/example-name/after/" and "messages/XXX-NNNNNN/example-name/after/Module.hs"
  forM_ (examples tmpl) $ \example -> do
    let example_dir = message_dir </> example
    let uppercase "" = ""
        uppercase (s : ss) = toUpper s : ss
    let example_name = uppercase example
    createDirectory example_dir
    putStrLn ("·· Creating blank example in directory " <> example_dir <> "...")
    createDirectory (example_dir </> "before")
    createDirectory (example_dir </> "after")
    let example_index =
          unlines
            [ "---",
              "title: <insert a title for this example here>",
              "---"
            ]
    writeFile (example_dir </> "index.md") example_index
    let before_module =
          unlines
            [ "module " <> example_name <> " where",
              "",
              "-- Insert the example containing a bug here."
            ]
    writeFile (example_dir </> "before" </> example_name <.> "hs") before_module
    let after_module =
          unlines
            [ "module " <> example_name <> " where",
              "",
              "-- Insert the fixed example here."
            ]
    writeFile (example_dir </> "after" </> example_name <.> "hs") after_module

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  tmpl <- runInputT defaultSettings readTemplate
  createFiles tmpl
