module Snd where

{-# LANGUAGE TupleSections #-}

snd' :: (a, a) -> a 
snd' (,x) = x 
