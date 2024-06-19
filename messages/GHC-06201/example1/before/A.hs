module A where

class Calculator a where
    add :: a -> a -> a
    multiply :: a -> a -> a

instance Calculator Int where
    add a b = a + b
