module TH (doSomethingWith) where

import Language.Haskell.TH

doSomethingWith :: Int -> DecsQ
doSomethingWith x = pure []
