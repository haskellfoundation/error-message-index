{-# OPTIONS_GHC -Wmissing-fields #-}
module Error where

data Rec = Rec { a :: Int, b :: String, c :: Bool }

x :: Rec
x = Rec { a = 1, b = "two", c = True }
