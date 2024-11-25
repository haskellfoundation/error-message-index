{-# OPTIONS_GHC -fwarn-missing-export-lists #-}
module Example1 where

hello :: String -> String
hello s = "Hello " <> s
