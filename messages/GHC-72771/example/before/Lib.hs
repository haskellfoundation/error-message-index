{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE TypeOperators #-}

module Lib where

import GHC.Generics

class Enumerate a where
  enumerate :: [a]
  default enumerate :: (Int ~ a) => a
  enumerate = [1 ..]
