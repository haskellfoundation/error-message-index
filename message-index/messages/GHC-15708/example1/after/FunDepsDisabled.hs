{-# LANGUAGE FunctionalDependencies #-}

module FunDepsDisabled where

class Convert a b | a -> b where
  convert :: a -> b
