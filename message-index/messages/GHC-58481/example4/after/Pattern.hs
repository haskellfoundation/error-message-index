{-# LANGUAGE PatternSynonyms #-}
module Pattern where

pattern Head x <- x:xs
