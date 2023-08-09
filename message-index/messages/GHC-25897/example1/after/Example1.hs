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
foo2 :: F x -> Bool
foo2 = \case
  FA -> True
  FB -> False

type family G a where
  G A = Bool
  G B = Bool

-- Compiles successfully, because the
-- result type of the pattern match
-- is known, from the type signature,
-- to be 'G x'
foo3 :: F x -> G x
foo3 = \case
  FA -> True
  FB -> False
