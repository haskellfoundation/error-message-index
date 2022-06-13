module NoFields where

data Record = Record {a :: Int}

r1 = Record {a = 5}

r2 = r1 {}
