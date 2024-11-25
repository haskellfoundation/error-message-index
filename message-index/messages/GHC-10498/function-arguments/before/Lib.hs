module Lib where

areDifferent :: a -> a -> Maybe (a, a)
areDifferent x x = Nothing
areDifferent x y = Just (x, y)
