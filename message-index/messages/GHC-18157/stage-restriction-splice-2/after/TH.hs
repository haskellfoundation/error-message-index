module TH (doSomethingWithName) where

import Language.Haskell.TH

doSomethingWithName :: Name -> DecsQ
doSomethingWithName x = pure []
