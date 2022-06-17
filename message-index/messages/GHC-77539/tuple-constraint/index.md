---
title: Use of a tuple constraint
---

## Message
```
TupleConstraint.hs:4:18: error: [GHC-77539]
    • Illegal tuple constraint: (Read a, Show a)
    • In the type signature:
        addFromString :: ((Read a, Show a), Num a) => String -> a -> String
    Suggested fix: Perhaps you intended to use ConstraintKinds
  |
4 | addFromString :: ((Read a, Show a), Num a) => String -> a -> String
  |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

## Explanation

This file is written in Haskell 2010, which does not have `ConstraintKinds`.
This means that a syntactic check is used to ensure that type class constraints form a single-level tuple, and this file does not satisfy that requirement.
Either de-nesting the tuple or enabling `ConstraintKinds` fixes the issue.
