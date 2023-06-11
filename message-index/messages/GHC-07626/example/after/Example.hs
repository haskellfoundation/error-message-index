module Example where

merge [] bs rest = bs ++ rest
merge as [] rest = as ++ rest
merge (a:as) (b:bs) rest
    | a > b     = merge as (b:bs) (a:rest)
    | otherwise = merge (a:as) bs (b:rest)
