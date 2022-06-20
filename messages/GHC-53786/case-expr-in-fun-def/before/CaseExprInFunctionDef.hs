module CaseExprInFunctionDef where

f (case x of { Nothing -> 0; Just a -> a }) = a
