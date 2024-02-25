{-# LANGUAGE NoFieldSelectors #-}

module NoFieldSelectorsExport (T (foo)) where

data T = MkT { foo :: T }
