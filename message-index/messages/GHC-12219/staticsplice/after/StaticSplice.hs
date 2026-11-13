{-# LANGUAGE StaticPointers #-}
{-# LANGUAGE TemplateHaskell #-}
module StaticSplice where

import GHC.StaticPtr
import Language.Haskell.TH.Syntax

main = print $([| show $ staticKey $ static 'a' |])


