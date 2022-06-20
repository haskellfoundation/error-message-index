{-# LANGUAGE NoNumericUnderscores #-}

module UnderscoreInFloatLiteral where

f :: Float -> ()
f 1000.01 = ()
f _   = ()
