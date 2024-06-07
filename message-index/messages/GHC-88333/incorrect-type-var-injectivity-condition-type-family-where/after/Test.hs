{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilyDependencies #-}

module IncorrectTypeVarLHSInjectivityCondition where

type family Fc a = r | r -> a where
  Fc a = a