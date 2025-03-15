{-# LANGUAGE StandaloneKindSignatures #-}

module SaksMultipleNames where

import Data.Kind (Type)

type A :: Type
type B :: Type
type C :: Type

data A
data B
data C
