{-# LANGUAGE BlockArguments #-}
module IfInFunAppExpr where

-- Requires BlockArguments language extension to work
example :: Int
example = length if True then [1] else []

-- Works without BlockArguments
example2 :: Int
example2 = length (if True then [1] else [])

-- Works without BlockArguments
example3 :: Int
example3 = length $ if True then [1] else []
