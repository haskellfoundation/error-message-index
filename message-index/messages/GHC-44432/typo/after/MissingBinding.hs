module MissingBinding where

import Numeric.Natural

factorial :: Natural -> Natural
factorial n
  | n == 0 = 1
  | otherwise = n * factorial (n - 1)