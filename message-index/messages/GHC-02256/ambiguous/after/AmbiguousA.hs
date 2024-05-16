{-# LANGUAGE DuplicateRecordFields #-}
module AmbiguousA where

data Foo = Foo { foo :: Int }

data Bar = Bar { foo :: Int }

