{-# LANGUAGE Haskell2010 #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE TupleSections #-}

module IllegalUnboxedTupleSection where

foo = (# 1, #)

