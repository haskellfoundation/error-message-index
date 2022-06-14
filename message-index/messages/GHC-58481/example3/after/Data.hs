{-# LANGUAGE TemplateHaskell #-}
module Data where
import Language.Haskell.TH

x :: Int
x = 42

static :: Q Exp
static = [| x |]