module DoNotationInPattern where

f :: Monad m => m Int -> m Bool
f m = do
    v <- m
    return $ v == 2