module WrongNamespace where

data Foo = Bar

{-# ANN type Foo (1 :: Int) #-}
