{-# LANGUAGE CApiFFI, RankNTypes #-}
module NestedForall where

foreign import capi "foo.h fun" fun :: forall a . Int -> a -> a
