{-# LANGUAGE PatternSynonyms #-}

module InsufficientArgumentsInSignature where

pattern P :: Int -> Int -> (Int, Int)
pattern P a b = (a, b)
