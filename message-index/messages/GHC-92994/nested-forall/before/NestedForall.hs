{-# LANGUAGE CApiFFI, RankNTypes #-}
module NestedForall where

foreign import capi "foo.h fun" fun :: Int -> (forall a . a -> a)
