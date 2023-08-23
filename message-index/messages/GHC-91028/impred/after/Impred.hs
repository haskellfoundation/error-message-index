{-# LANGUAGE ImpredicativeTypes #-}
module Impred where

import Control.Monad.ST

test :: (forall s. ST s a) -> a
test = id runST
