module ForallIdentifier where

forall :: (a -> Bool) -> [a] -> Bool
forall f ls = and (map f ls)
