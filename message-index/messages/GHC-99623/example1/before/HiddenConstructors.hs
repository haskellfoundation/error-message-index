module HiddenConstructors ( TypeWithoutVisibleCtrs, TypeWithNoCtrs ) where

data TypeWithoutVisibleCtrs = Ctr1 Int | Ctr2 | Ctr3 Bool Bool

data TypeWithNoCtrs