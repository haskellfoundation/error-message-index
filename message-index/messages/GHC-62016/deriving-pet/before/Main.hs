{-# language DeriveFunctor #-}
module Main where

data Pet = Cat | Dog 
  deriving Functor
