module ForgotImport where

import Data.List (sort)

top10 :: [Int] -> [Int]
top10 = take 10 . sort
