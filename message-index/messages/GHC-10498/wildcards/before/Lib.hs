{-# LANGUAGE RecordWildCards #-}

module Lib where

data Foo = Foo { x :: Int, y :: Int }

foo :: Foo -> Int -> Int
foo Foo{..} x = x + y
