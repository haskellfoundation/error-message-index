module IllegalDatatypeContext where

data D a = D a

f :: (Show a) => D a -> IO ()
f (D d) = putStrLn (show d)