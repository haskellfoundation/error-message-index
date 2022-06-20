module IncorrectImport where

import Foo (Bar(..))

barAddOne :: Bar -> Bar
barAddOne (MkBar n) = MkBar (n + 1)
