{-# OPTIONS_GHC -fwarn-missing-export-lists #-}
module Example1 (hello) where

hello :: String -> String
hello s = "Hello " <> s
