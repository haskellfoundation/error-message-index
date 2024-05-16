module AmbiguousB where

import qualified AmbiguousA as Foo (Foo(..))
import qualified AmbiguousA as Bar (Bar(..))

blah :: Bar.Bar -> Bar.Bar
blah bar = bar { Bar.foo = 5 }
