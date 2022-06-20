module IllegalUnboxedString where

g :: String -> Bool
g y = case y of
    "a" -> True
    _ -> False



