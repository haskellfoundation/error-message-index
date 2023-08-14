{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

module Example2 where

data X = A | B

data F x where
  FA :: F A
  FB :: F B

type family G a where
  G A = Bool
  G B = Bool

-- Compiles successfully, because the
-- result type of the pattern match
-- is known, from the type signature,
-- to be 'G x'
foo :: F x -> G x
foo = \case
  FA -> True
  FB -> False
