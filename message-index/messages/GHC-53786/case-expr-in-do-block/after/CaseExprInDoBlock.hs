module CaseExprInDoBlock where

x :: [a]
x = do
  case () of
    () -> do
      a <- []
      pure a
