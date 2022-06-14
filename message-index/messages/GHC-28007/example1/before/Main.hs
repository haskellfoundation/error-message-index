{-# LANGUAGE ScopedTypeVariables #-}

module Main where

{-# LANGUAGE RecursiveDo #-}

main = pure ()

foo :: forall a. a -> a
foo x = mdo x
