module WrongNamespace where

data Foo = Bar

{-# ANN Foo (1 :: Int) #-}
