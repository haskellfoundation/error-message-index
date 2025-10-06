f :: (forall r. r -> r) -> Int
f x = g x

g :: (String -> String) -> Int
g _ = 1337
