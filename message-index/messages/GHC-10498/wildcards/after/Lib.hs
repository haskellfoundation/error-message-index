{-# LANGUAGE NamedFieldPuns #-}

module Lib where

data Foo = Foo { x :: Int, y :: Int }

foo :: Foo -> Int -> Int
foo Foo{y} x = x + y
