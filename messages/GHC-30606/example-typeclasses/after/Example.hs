{-# OPTIONS_GHC -Wredundant-constraints #-}

module Example where

f :: Ord a => a -> a -> Bool
f x y = (x < y) || x == y
