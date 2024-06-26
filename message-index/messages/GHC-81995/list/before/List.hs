module List where

-- Evaluates to [2].
list :: [Int]
list = do
  return 1 -- This action has no side effects and is completely ignored.
  return 2
