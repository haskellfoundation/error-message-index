{-# LANGUAGE Safe #-}
module IgnoredRule where

{-# RULES "myId" forall x. myId x = x #-}
myId :: a -> a
myId x = x
