{-# LANGUAGE Haskell2010 #-}

module Illegal_explicit_forall where

foo :: forall a. a
foo = foo
