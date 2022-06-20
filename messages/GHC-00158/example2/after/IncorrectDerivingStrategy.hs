{-# LANGUAGE DerivingStrategies #-}

module IncorrectDerivingStrategy where

newtype IntWrapper = Wrap { unwrap :: Int }
  deriving newtype Num
