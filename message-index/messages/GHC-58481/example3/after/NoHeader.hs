{-# LANGUAGE TemplateHaskell #-}
module NoHeader where 
import Data (static)

f = $(static)
