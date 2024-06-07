{-# LANGUAGE DerivingStrategies #-}
module IllegalDerivingStrategy where

newtype Year = MkYear Int
  deriving newtype Show
