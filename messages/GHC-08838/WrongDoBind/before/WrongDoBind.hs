module WrongDoBind where

doubleReturn :: forall m. Monad m => m Int
doubleReturn = do
  return (return 10 :: m Int)
  return 10
