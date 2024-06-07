{-# LANGUAGE TemplateHaskell #-}
module Example where

import TH (doSomethingWith)

foo :: Int
foo = 1

doSomethingWith foo
