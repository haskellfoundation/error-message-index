{-# LANGUAGE TemplateHaskell #-}
module Example where

import TH (doSomethingWithName)

foo :: Int
foo = 1

doSomethingWithName 'foo
