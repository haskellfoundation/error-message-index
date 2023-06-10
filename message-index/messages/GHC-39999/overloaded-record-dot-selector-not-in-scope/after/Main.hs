module Main where

import DataType (MyData(foo))

getFoo :: MyData -> Int
getFoo x = x.foo
