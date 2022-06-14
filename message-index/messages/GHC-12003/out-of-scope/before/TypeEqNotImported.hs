
{-# OPTIONS -Wcompat #-}
module TypeEqNotImported where

import Prelude (id)

f :: (a ~ b) => a -> b
f = id
