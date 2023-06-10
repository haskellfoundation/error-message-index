module Snd where

{-# LANGUAGE TupleSections #-}

snd' :: (a, a) -> a 
snd' (_,x) = x 
