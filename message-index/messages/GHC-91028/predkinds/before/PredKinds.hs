{-# LANGUAGE ImpredicativeTypes #-}
module PredKinds where

import Data.Proxy

t :: Proxy (z :: forall k. a)
t = undefined
