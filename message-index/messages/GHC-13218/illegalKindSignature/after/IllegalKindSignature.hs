{-# LANGUAGE LinearTypes, KindSignatures #-}
module IllegalKindSignature where

data Void1 :: * -> *
