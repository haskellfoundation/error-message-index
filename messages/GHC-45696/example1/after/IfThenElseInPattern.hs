module IfThenElseInPattern where

f :: Bool -> String -> Bool
f a b = case (a, b) of
    (True, "something") -> True
    (False, "something else") -> True
    _ -> False

f' :: Bool -> String -> Bool
f' a b = (a && b == "something") || (not a && b == "something else")