module CaseExprInDoBlock where

x :: [a]
x = do
  case () of
    () ->
      a <- []
      pure a
