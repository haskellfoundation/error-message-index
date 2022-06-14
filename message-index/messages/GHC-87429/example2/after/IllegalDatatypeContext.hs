{-# LANGUAGE GADTs #-}
module IllegalDatatypeContext where

data D a where
    ShowReadD :: (Show a, Read a) => a -> D a