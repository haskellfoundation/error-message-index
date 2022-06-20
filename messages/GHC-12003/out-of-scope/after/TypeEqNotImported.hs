{-# LANGUAGE ExplicitNamespaces #-}
{-# OPTIONS -Wcompat #-}
module TypeEqNotImported where

import Prelude (id, type (~))

f :: (a ~ b) => a -> b
f = id
