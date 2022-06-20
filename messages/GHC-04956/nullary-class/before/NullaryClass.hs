{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
module NullaryClass where

class ThisClassHasNoParameters
deriving stock instance ThisClassHasNoParameters
