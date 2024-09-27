{-# LANGUAGE TemplateHaskell #-}
module Example where

import Foo (foo)
import Language.Haskell.TH

x :: Integer
x = $foo
