f :: (forall r. r -> r) -> Int
f = g

g :: (String -> String) -> Int
g _ = 1337
