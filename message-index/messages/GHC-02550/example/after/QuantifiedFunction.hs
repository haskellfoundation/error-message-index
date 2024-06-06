{-# LANGUAGE QuantifiedConstraints #-}
{-# LANGUAGE TypeFamilies          #-}

module QuantifiedFunction where

import Data.Kind

class C a where

class A a where

f :: (C Int => A Int) => ()
f = ()
