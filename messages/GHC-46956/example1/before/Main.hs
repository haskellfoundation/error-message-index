{-# LANGUAGE PolyKinds, RankNTypes, ImpredicativeTypes #-}

module Main where

import Data.Kind

data SameKind :: k -> k -> *

foo :: forall b. (forall k (a :: k). SameKind a b) -> ()
foo = undefined

main :: IO ()
main = pure ()
