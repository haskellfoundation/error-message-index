---
title: Deriving Functor for a ground type
---

## Error message

```
Main.hs:5:12: error: [GHC-62016]
    • Cannot derive well-kinded instance of form ‘Functor (Pet ...)’
        Class ‘Functor’ expects an argument of kind ‘* -> *’
    • In the data declaration for ‘Pet’
```

## Explanation

The `Functor` type class applies to type constructors; that is,
data types which take one other type as a parameter. The `Pet` data type
defined in the code does *not* take any type parameters.
As a result, GHC cannot write the `Functor` instance for you.
