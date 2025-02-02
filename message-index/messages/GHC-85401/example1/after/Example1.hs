{-# OPTIONS_GHC -Wmissing-export-lists #-}
module Example1 (hello) where

hello :: String -> String
hello s = "Hello " <> s
