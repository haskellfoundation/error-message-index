{-# OPTIONS_GHC -Wderiving-typeable #-}
module Example where

import Data.Typeable

data Foo = Foo Int | Bar Char
  deriving Typeable
