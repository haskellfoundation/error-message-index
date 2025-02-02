{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedLabels #-}

module Label where

import GHC.OverloadedLabels (IsLabel)

foo :: (IsLabel "foo" ()) => ()
foo = #foo
