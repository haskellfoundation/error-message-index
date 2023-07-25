module ForallIdentifier where

forAll :: (a -> Bool) -> [a] -> Bool
forAll f ls = and (fmap f ls)
