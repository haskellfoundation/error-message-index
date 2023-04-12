module MissingBinding where

import Numeric.Natural

factorial :: Natural -> Natural
fatcorial n
  | n == 0 = 1
  | otherwise = n * factorial (n - 1)
