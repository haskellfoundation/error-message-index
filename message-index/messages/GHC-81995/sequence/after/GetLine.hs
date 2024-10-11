module GetLine where

main :: IO ()
main = do
  sequence_ [putStrLn "First line", putStrLn "Second line"]
  putStrLn "Done."
