{-# LANGUAGE TemplateHaskell #-}

module CannotReifyOutOfScopeThing where

import Language.Haskell.TH

doesn'tExist = "I do so!"

do  t <- reifyType (mkName "doesn'tExist")
    return []
