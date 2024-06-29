{-# LANGUAGE Haskell2010 #-}
{-# LANGUAGE UnboxedTuples #-}
-- TupleSections not enabled

module IllegalUnboxedTupleSection where

foo = (# 1, #)

