module ForgotImport where

top10 :: [Int] -> [Int]
top10 = take 10 . sort
