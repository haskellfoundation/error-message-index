{-# LANGUAGE NoNumericUnderscores #-}

module UnderscoreInFloatLiteral where

f :: Float -> ()
f 1_000.0_1 = ()
f _   = ()
