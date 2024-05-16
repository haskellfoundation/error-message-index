{-# LANGUAGE DuplicateRecordFields #-}
module Ambiguous where

data Foo = Foo { foo :: Int }

data Bar = Bar { foo :: Int }

blah :: Bar -> Bar
blah bar = bar { foo = 5 }
