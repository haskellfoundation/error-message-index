{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

module Example2 where

data X = A | B

data F x where
  FA :: F A
  FB :: F B

-- Results in error GHC-25897
foo = \case
  FA -> True
  FB -> False
