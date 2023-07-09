{-# LANGUAGE BangPatterns #-}
{-# OPTIONS_HUGS #-}
module UnrecognisedPragmas where

x :: Int
x = 42
{-# INLINE x #-}
