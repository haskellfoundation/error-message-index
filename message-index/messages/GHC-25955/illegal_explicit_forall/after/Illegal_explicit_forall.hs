{-# LANGUAGE Haskell2010 #-}
{-# LANGUAGE ExplicitForAll #-}

module Illegal_explicit_forall where

foo :: forall a. a
foo = foo
