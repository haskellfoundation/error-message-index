module IfThenElseInPattern where

f :: Bool -> String -> Bool
f a b = case a of
    (if a then b == "something" else b == "something else") -> True
    _ -> False