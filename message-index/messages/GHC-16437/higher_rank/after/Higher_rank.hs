module Higher_rank where

-- unfortunately we just need a rank 1 type
data Bad a = MkBad a deriving Eq
