{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
module TyArgs where

f :: Maybe Int -> Int
f (Just @Int x) = x
f Nothing = 10
