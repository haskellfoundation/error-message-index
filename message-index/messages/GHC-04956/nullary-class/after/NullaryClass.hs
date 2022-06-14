{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE StandaloneDeriving #-}
module NullaryClass where

class ThisClassHasAParameter a
deriving instance ThisClassHasAParameter Int
