module DoubleDeprecation where

{-# DEPRECATED pi "pi is deprecated." #-}
{-# DEPRECATED pi "Chosen approximation turned out to be too imprecise." #-}
pi :: Int
pi = 3
