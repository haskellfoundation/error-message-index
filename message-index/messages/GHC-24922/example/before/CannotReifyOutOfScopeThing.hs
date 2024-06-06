{-# LANGUAGE TemplateHaskell #-}

module CannotReifyOutOfScopeThing where

import Language.Haskell.TH

do  t <- reifyType (mkName "doesn'tExist")
    return []
