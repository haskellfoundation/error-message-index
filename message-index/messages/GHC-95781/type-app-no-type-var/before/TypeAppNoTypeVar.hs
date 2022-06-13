{-# LANGUAGE TypeApplications #-}

module TypeAppNoTypeVar where

plus :: Int -> Int -> Int
plus = (+)

x = plus @Int 5 7
