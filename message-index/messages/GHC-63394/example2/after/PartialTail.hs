module PartialTail where

import Data.List.NonEmpty (NonEmpty((:|)))
import qualified Data.List.NonEmpty as NonEmpty

-- Replace `tail` with `drop 1`.
example1 :: [Int]
example1 =
  let list = 1 : 2 : 3 : [] in
  drop 1 list

-- Use pattern-matching.
example2 :: [Int]
example2  =
  let list = 1 : 2 : 3 : [] in
  case list of
    [] -> []
    _ : xs -> xs

-- Refactor to use NonEmpty.tail.
example3 :: [Int]
example3 =
  let list :: NonEmpty Int
      list = 1 :| 2 : 3 : [] in
  NonEmpty.tail list
