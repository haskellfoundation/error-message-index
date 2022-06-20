module OrphanInstance where

import Foo

instance IsAFoo Foo where
    convertToFoo = id