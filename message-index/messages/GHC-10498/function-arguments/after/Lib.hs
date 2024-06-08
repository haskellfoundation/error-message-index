module Lib where

areDifferent :: Eq a => a -> a -> Maybe (a, a)
areDifferent x y
  | x == y = Nothing
areDifferent x y = Just (x, y)
