---
title: Type alias constraint
---

GHC limits tuples to 64 elements, you cannot define constraints on bigger arity.

## Error Message

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
