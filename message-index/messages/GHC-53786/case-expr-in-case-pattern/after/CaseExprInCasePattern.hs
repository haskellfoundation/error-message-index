module CaseExprInFunctionDef where

f :: a -> b -> Int
f x y = case x of
  _ -> case y of
    _ -> 1
