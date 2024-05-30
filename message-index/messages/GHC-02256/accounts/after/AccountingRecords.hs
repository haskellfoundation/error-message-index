{-# LANGUAGE DuplicateRecordFields #-}
module AccountingRecords where

data BusinessAccount = MkBusinessAccount { balance :: Int }

data PersonalAccount = MkPersonalAcccount { balance :: Int }
