{-# LANGUAGE DuplicateRecordFields #-}
module Accounting where

data BusinessAccount = MkBusinessAccount { balance :: Int }

data PersonalAccount = MkPersonalAccount { balance :: Int }

resetPersonalAccount :: PersonalAccount -> PersonalAccount
resetPersonalAccount account = account { balance = 0 }
