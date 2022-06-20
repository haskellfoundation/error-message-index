{-# LANGUAGE DerivingStrategies #-}
module DeriveNewtypeData where

data Weekend = Saturday | Sunday
  deriving newtype Show
