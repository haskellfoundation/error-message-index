module DoubleDot where

data Record = Record {field :: Integer}

x = Record {field = 5}
y = x {field=8, ..}
