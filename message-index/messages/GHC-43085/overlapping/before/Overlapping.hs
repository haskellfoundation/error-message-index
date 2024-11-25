module Overlapping where

class Formatter a where
  format :: a -> String

instance Formatter Int where
  format = show

instance (Formatter a) => Formatter (Maybe a) where
  format (Just x) = format x
  format Nothing = ""

instance Formatter (Maybe Int) where
  format (Just x) = format x
  format Nothing = "NaN"

main :: IO ()
main = putStrLn $ format (Nothing :: Maybe Int)
