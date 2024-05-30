module Accounting where

import qualified AccountingRecords as Personal (PersonalAccount(..))
import qualified AccountingRecords as Business (BusinessAccount(..))

resetPersonalAccount :: Personal.PersonalAccount -> Personal.PersonalAccount
resetPersonalAccount account = account { Personal.balance = 0 }
