{-# LANGUAGE DefaultSignatures #-}
module Main where
import GHC.Generics

main :: IO ()
main = undefined

class Enum a where
  enum :: [a]
  default enum :: (Int ~ a) => a
  enum = [1..]