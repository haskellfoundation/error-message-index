---
title: Type alias constraint
---

## Error Message

You cannot define constraints of arity bigger than 64 and need to nest tuples instead.

```haskell
Eq.hs:3:12: error: [GHC-89347]
    • Constraint tuple arity too large: 66 (max arity = 64)
        Instead, use a nested tuple
    • In the type ‘(Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a,
                    Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a,
                    Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a,
                    Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a,
                    Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a,
                    Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a, Eq a,
                    Eq a, Eq a, Eq a)’
      In the type declaration for ‘T’
```
