module Foo (foo) where

import Language.Haskell.TH

foo :: Q Exp
foo = pure . LitE $ IntegerL 1
