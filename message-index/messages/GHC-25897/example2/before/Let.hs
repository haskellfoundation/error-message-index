module Main where

data Showable where
  MkShowable :: Show a => a -> Showable

showShowable :: Showable -> String
showShowable showable =
  let MkShowable x = showable
  in show x

main :: IO ()
main = putStrLn $ showShowable (MkShowable 42)
