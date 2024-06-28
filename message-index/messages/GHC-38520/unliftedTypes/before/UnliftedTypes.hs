{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UnliftedNewtypes #-}

module UnliftedTypes where

import GHC.Exts

newtype MyInt :: TYPE 'IntRep where
  MkMyInt :: Int# -> MyInt

foo :: Int# -> MyInt -> (# Int, Int #) -> ()
foo !a !b !c = ()
