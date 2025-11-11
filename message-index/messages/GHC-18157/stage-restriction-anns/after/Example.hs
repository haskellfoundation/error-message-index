module Example where

import Bar (bar)

{-# ANN foo bar #-}
foo :: Integer
foo = 1
