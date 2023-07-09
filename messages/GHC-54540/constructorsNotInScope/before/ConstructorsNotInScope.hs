{-# LANGUAGE StandaloneDeriving #-}
module ConstructorsNotInScope where

import System.IO( Handle )

deriving instance Eq Handle
