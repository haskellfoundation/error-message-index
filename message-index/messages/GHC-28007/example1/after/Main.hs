{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Prelude

main = pure ()

foo :: forall a. a -> a
foo x = mdo x
