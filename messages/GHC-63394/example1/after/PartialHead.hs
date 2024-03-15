module PartialHead where

import Data.List.NonEmpty (NonEmpty((:|)))
import qualified Data.List.NonEmpty as NonEmpty
import Data.Maybe (listToMaybe)

-- Use pattern-matching, handling the empty case explicitly.
example1 :: Int
example1  =
  let list = 1 : 2 : 3 : [] in
  case list of
    [] -> 0
    hd : _ -> hd

-- Use listToMaybe.
example2 :: Maybe Int
example2 =
  let list = 1 : 2 : 3 : [] in
  listToMaybe list

-- Refactor to use NonEmpty.head.
example3 :: Int
example3 =
  let list :: NonEmpty Int
      list = 1 :| 2 : 3 : [] in
  NonEmpty.head list
