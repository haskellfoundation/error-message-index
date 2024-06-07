module IncorrectTypeVarLHSInjectivityCondition where

type family Fc a = r | a -> a where
  Fc a = a
