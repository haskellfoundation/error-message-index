module GetLine where

main :: IO ()
main = do
  sequence [putStrLn "First line", putStrLn "Second line"]
  putStrLn "Done."
