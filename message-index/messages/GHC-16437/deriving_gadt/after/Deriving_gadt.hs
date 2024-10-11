{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}

module Deriving_gadt where

data T a b where
     Mk :: Int -> b -> T Int b

deriving instance Functor (T a)
