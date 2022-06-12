module NotInScopeClass where

class B a where
  op :: a -> a

class (B a) => C a where
 op1 :: a -> Int
