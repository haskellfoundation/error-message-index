{-# LANGUGE BangPatterns #-}
--       ^ missing A
{-# OPTION_HUGS #-}
--        ^ missing S
module UnrecognisedPragmas where

x :: Int
x = 42
{-# INLNE x #-}
--     ^ missing I

