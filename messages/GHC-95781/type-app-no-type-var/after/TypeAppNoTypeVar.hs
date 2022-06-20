{-# LANGUAGE TypeApplications #-}

module TypeAppNoTypeVar where

plus :: Int -> Int -> Int
plus = (+)

x = plus 5 7
