{-# OPTIONS_GHC -Wredundant-constraints #-}

module Example where

f :: (a ~ b, b ~ a) => a -> b
f x = x
