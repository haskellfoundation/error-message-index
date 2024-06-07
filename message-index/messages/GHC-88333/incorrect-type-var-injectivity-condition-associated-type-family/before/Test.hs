module IncorrectTypeVarLHSInjectivityCondition where

class Fcl a where
  type Ft a = r | a -> a