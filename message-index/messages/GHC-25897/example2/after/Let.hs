module Main where

data Showable where
  MkShowable :: Show a => a -> Showable

showShowable :: Showable -> String
showShowable showable =
  case showable of
    MkShowable x -> show x

main :: IO ()
main = putStrLn $ showShowable (MkShowable 42)
