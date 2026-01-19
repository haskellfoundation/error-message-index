{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilyDependencies #-}

module IncorrectTypeVarLHSInjectivityCondition where

class Fcl a where
  type Ft a = r | r -> a
