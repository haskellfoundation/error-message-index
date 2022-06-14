---
title: Illegal datatype context, fixed with use-site constraints
---

In this example, we wish to constrain the type `a` which can parameterise the type `D` to a type that implements the `Show` and `Read` typeclasses. Whilst this can be solved currently by `-XDatatypeContexts`, this extension is deprecated.

Instead, a solution is to put the constraints on functions that *use* the datatype.

## Error Message
```
IllegalDatatypeContext.hs:5:6: error: [GHC-87429]
    Illegal datatype context (use DatatypeContexts): (Show a) =>
  |
5 | data (Show a) => D a = D a
  |      ^^^^^^^
```