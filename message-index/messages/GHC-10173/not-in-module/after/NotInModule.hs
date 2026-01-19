module NotInModule where

{-# ANN myLength "an annotation" #-}

myLength :: Foldable t => t a -> Int
myLength = length
