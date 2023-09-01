{-# LANGUAGE ImpredicativeTypes #-}
module PredKinds where

import Data.Proxy

t :: forall a (z :: forall k. a). Proxy z
t = Proxy
