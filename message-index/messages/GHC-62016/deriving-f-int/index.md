---
title: Deriving Functor for a type with an argument of non-Type kind
---

## Error message

```
Main.hs:5:12: error: [GHC-62016]
    • Cannot derive well-kinded instance of form ‘Functor (AppliedToInt ...)’
        Class ‘Functor’ expects an argument of kind ‘* -> *’
    • In the data declaration for ‘AppliedToInt’
```

## Explanation

The `Functor` type class applies to type constructors of
exactly the kind `Type -> Type`. However, the kind of `AppliedToInt`
is `(Type -> Type) -> Type` instead. There is thus a mismatch
between the expected and given kinds.
