module IllegalDatatypeContext where

data (Show a, Read a) => D a = D a