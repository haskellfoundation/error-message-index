{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

main = pure ()

foo :: forall a. a -> a
foo x = mdo x
