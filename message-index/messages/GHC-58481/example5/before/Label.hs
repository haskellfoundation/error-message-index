module Label where

import GHC.OverloadedLabels (IsLabel)

foo :: (IsLabel "foo" ()) => ()
foo = #foo
