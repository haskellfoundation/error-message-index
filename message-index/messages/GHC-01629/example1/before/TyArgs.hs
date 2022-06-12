{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
module TyArgs where

f :: Maybe Int -> Int
f (Just @Int @Bool x) = x
f Nothing = 10
