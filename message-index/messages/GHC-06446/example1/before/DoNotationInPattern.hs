module DoNotationInPattern where

f :: Monad m => m Int -> m Bool
f (do a; b; c) = do
    v <- c
    return $ v == 2
