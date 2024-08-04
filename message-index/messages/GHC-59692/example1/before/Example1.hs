module Example1 where

data T a

instance Eq a => Eq (T a) where
  (==) = (==)

instance Show a => Eq (T a) where
  (==) = (==)
