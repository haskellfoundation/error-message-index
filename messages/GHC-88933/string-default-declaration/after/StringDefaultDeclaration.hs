{-# LANGUAGE OverloadedStrings #-}
module StringDefaultDeclaration where

default (String)

main :: IO ()
main = print "Hello, World!"
