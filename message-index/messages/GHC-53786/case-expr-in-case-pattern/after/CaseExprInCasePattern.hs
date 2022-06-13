module CaseExprInFunctionDef where

f x y = case x of
  _ -> case y of
    _ -> 1
