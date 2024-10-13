module WrongDoBind where

doubleReturn :: forall m. Monad m => m Int
doubleReturn = return 10
