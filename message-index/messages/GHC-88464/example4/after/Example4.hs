module Example4 where

foo :: Eq a => a -> Bool
foo x = x == x
