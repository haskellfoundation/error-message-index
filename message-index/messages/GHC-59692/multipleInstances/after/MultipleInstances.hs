module MultipleInstances where

newtype Sum = Sum { getSum :: Int }

instance Semigroup Sum where
    (<>) x y = Sum (getSum x + getSum y)

newtype Product = Product { getProduct :: Int }

instance Semigroup Product where
    (<>) x y = Product (getProduct x * getProduct y)