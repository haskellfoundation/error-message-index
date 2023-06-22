module Example where

-- Is the second argument the square of the first?
sq :: Int -> Int 
sq x = x^2

f :: Int -> Int -> Bool 
f n m 
    | m == sq n = True
    | otherwise = False 
