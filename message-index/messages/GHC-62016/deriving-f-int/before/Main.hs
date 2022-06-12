{-# language DeriveFunctor #-}
module Main where

data AppliedToInt f = AppliedToInt (f Int) 
  deriving Functor
