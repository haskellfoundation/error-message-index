module Example where

-- Is the second argument the square of the first? 
f :: Int -> Int -> Bool 
f n (let sq = x^2 in sq n) = True 
f n _ = False
