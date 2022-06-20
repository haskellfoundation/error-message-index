{-# LANGUAGE DataKinds, PolyKinds, ExplicitForAll #-}
module DependencyOrder where

import Data.Kind

data SameKind :: k -> k -> *

foo :: forall a k (b :: k). SameKind a b
foo = undefined
