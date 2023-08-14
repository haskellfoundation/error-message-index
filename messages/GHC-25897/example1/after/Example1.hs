{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

module Example1 where

data X = A | B

data F x where
  FA :: F A
  FB :: F B

-- Compiles successfully, because the
-- result type of the pattern match
-- is known, from the type signature,
-- to be 'Bool'.
foo :: F x -> Bool
foo = \case
  FA -> True
  FB -> False
