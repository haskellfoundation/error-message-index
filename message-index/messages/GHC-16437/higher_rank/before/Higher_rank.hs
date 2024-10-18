{-# LANGUAGE RankNTypes #-}

module Higher_rank where

data Bad = MkBad (forall a. a) deriving Eq
