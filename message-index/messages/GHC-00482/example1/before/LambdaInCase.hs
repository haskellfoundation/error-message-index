module LambdaInCase where

f :: Int -> Int
f x =
  case x of
    \a -> a
