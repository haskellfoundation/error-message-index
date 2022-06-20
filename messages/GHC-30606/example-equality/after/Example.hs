{-# OPTIONS_GHC -Wredundant-constraints #-}

module Example where

f :: (a ~ b) => a -> b
f x = x
