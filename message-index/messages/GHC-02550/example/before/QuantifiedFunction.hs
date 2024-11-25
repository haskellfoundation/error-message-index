{-# LANGUAGE QuantifiedConstraints #-}
{-# LANGUAGE TypeFamilies          #-}

module QuantifiedFunction where

import Data.Kind

class C a where

type family A :: k -> Constraint

f :: (C Int => A Int) => ()
f = ()
