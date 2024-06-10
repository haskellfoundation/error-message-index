{-# OPTIONS_GHC -fwarn-unused-record-wildcards #-}
{-# LANGUAGE RecordWildCards #-}
module Example1 where

data Foo = Foo { x :: Int, y :: Int, name :: String }

f :: Foo -> String
f Foo{} = "Hello"
