{-# LANGUAGE TemplateHaskell #-}
module Example where

import Language.Haskell.TH

foo :: Q Exp
foo = pure . LitE $ IntegerL 1

x :: Integer
x = $foo
