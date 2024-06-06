{-# LANGUAGE DeriveFunctor #-}
module AddAFunctor where

data MyFunctor a = MyFunctor a a
  deriving Functor
