module Main where

import Control.Monad (forM_, forM)
import Data.Char (toLower, isSpace)
import Text.Read (readMaybe)
import System.Directory (createDirectory)
import System.FilePath ((</>))

-------------------------------------------------------------------------------
-- Querying the user about the diagnostic
-------------------------------------------------------------------------------

-- | Remove leading and trailing whitespace, and convert to lower case.
normalize :: String -> String
normalize = fmap toLower . strip
  where
    strip = f . f
    f = reverse . dropWhile isSpace

-- Querying for the system: GHC / GHCup / Stack

data System = GHC | GHCup | Stack deriving Show

readSystem :: IO System
readSystem = do
    putStrLn "For which system do you want to generate a message?"
    putStrLn " 1) GHC"
    putStrLn " 2) GHCup"
    putStrLn " 3) Stack"
    putStr "Input (Default = GHC): "
    ln <- getLine
    case normalize ln of
        "1" -> pure GHC
        "ghc" -> pure GHC
        "2" -> pure GHCup
        "ghcup" -> pure GHCup
        "3" -> pure Stack
        "stack" -> pure Stack
        _ -> pure GHC

-- Querying for the error code

-- | We need to encode the error code as a string in order 
--   to preserve leading 0's.
type ErrorCode = String

readCode :: IO ErrorCode
readCode = do
    putStrLn "What is the numeric code that you want to document."
    putStrLn "For example, enter \"01234\" if you want to document GHC-01234."
    putStr "Input: "
    ln <- getLine
    case (readMaybe ln) :: Maybe Int of
        Nothing -> do
            putStrLn "Could not parse the input as an integer. Only enter the numeric part of the error."
            readCode
        Just _ -> pure ln

-- Title
type Title = String

readTitle :: IO Title
readTitle = do
    putStrLn "What is the title of the error message."
    putStr "Input: "
    getLine

-- Summary
type Summary = String

readSummary :: IO Summary
readSummary = do
    putStrLn "Give a short summary of the error message."
    putStr "Input: "
    getLine

-- Severity
data Severity = Error | Warning deriving Show

readSeverity :: IO Severity
readSeverity = do
    putStrLn "What is the severity of the diagnostic."
    putStrLn " 1) Error"
    putStrLn " 2) Warning"
    putStr "Input (Default = Error): "
    ln <- getLine
    case normalize ln of
        "1" -> pure Error
        "error" -> pure Error
        "2" -> pure Warning
        "warning" -> pure Warning
        _ -> pure Error

-- Warning flag
type WarningFlag = String

-- | Only ask for a warning flag if Severity = Warning.
readWarningFlag :: Severity -> IO (Maybe WarningFlag)
readWarningFlag Warning = do
    putStrLn "What is the warning flag which enables this warning."
    putStrLn "For example, enter \"-Wtabs\" if you are documenting GHC's warning about tabs in your source file."
    putStr "Input: "
    ln <- getLine
    pure (Just ln)
readWarningFlag _ = pure Nothing

-- Version
type Version = String

readVersion :: IO Version
readVersion = do
    putStrLn "Which version of the tool emitted the numeric code (not the message) for the first time?"
    putStrLn "Note: For GHC this is most likely 9.6.1."
    putStr "Input: "
    getLine

-- Examples
type Examples = [String]

validateExampleName :: String -> Bool
validateExampleName "" = False
validateExampleName str = not (any isSpace str)

-- | Only ask for examples if the system is GHC.
readExamples :: System -> IO Examples
readExamples GHC = do
    putStrLn "How many examples should be generated?"
    putStr "Input: "
    ln <- getLine
    case (readMaybe ln) :: Maybe Int of
        Nothing -> pure []
        (Just n) -> forM [1..n] readExample
readExamples _ = pure []

readExample :: Int -> IO String
readExample i = do
    putStrLn ("Give a name for example " <> show i)
    putStr "Input: "
    ln <- getLine
    if validateExampleName ln then pure ln else readExample i

-- Template
data Template =
    MkTemplate { system :: System
               , code :: ErrorCode
               , title :: Title
               , summary :: Summary
               , severity :: Severity
               , warningflag :: Maybe WarningFlag
               , introduced :: Version
               , examples :: Examples
               } deriving Show


readTemplate :: IO Template
readTemplate = do
    putStrLn "This tool helps you create the scaffolding for a new error message on the error-message-index."
    putStrLn "You can leave any of the text fields blank and fill them in by hand later."
    putStrLn ""
    sys <- readSystem
    putStrLn ""
    code <- readCode
    putStrLn ""
    title <- readTitle
    putStrLn ""
    summary <- readSummary
    putStrLn ""
    severity <- readSeverity
    putStrLn ""
    warningflag <- readWarningFlag severity
    putStrLn ""
    version <- readVersion
    putStrLn ""
    examples <- readExamples sys
    pure (MkTemplate sys code title summary severity warningflag version examples)

-------------------------------------------------------------------------------
-- Creating the files and directories from the template
-------------------------------------------------------------------------------

createFiles :: Template -> IO ()
createFiles tmpl = do
    putStrLn "Creating scaffolding for the following configuration:"
    print tmpl
    putStrLn ""
    
    -- Create the new directory "messages/XXX-NNNNNN/" and "messages/XXX-NNNNNN/index.md"
    let message_dir = "messages" </> case system tmpl of { GHC -> "GHC-"; GHCup -> "GHCup-"; Stack -> "S-" } ++ code tmpl
    createDirectory message_dir
    let toplvl_index = unlines [ "---" 
                               , "title: " <> title tmpl
                               , "summary: " <> summary tmpl
                               , "severity: " <> case severity tmpl of { Warning -> "warning"; Error -> "error" }
                               , "introduced: " <> introduced tmpl
                               , "---"
                               , ""
                               , "Insert your error message here."
                               ]
    writeFile (message_dir </> "index.md") toplvl_index

    -- Create the example directories and entries:
    -- - "messages/XXX-NNNNNN/" and "messages/XXX-NNNNNN/index.md"
    -- - "messages/XXX-NNNNNN/before/" and "messages/XXX-NNNNNN/before/Module.hs"
    -- - "messages/XXX-NNNNNN/after/" and "messages/XXX-NNNNNN/after/Module.hs"
    forM_ (examples tmpl) $ \example -> do
        let example_dir = message_dir </> example
        createDirectory example_dir
        createDirectory (example_dir </> "before")
        createDirectory (example_dir </> "after")
        let example_index = unlines [ "---"
                                     , "title: <insert a title for this example here>"
                                     , "---"
                                     ]
        writeFile (example_dir </> "index.md") example_index
        let before_module = unlines [ "module Example where"
                                    , ""
                                    , "-- Insert the example containing a bug here."
                                    ]
        writeFile (example_dir </> "before" </> "Example.hs") before_module
        let after_module = unlines [ "module Example where"
                                   , ""
                                   , "-- Insert the fixed example here."
                                   ]
        writeFile (example_dir </> "after" </> "Example.hs") after_module
   

-------------------------------------------------------------------------------
-- Main
-------------------------------------------------------------------------------

main :: IO ()
main = do
    tmpl <- readTemplate
    createFiles tmpl
