{-# LANGUAGE TypeApplications #-}

 module MissingSpaceTypeApplication where

 f :: (forall a. a -> b) -> (Int -> b)
 f x = x @Int