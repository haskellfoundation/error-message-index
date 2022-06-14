---
title: Illegal datatype context, fixed with GADTs
---

In this example, we wish to constrain the type `a` which can parameterise the type `D` to a type that implements the `Show` and `Read` typeclasses. Whilst this can be solved currently by `-XDatatypeContexts`, this extension is deprecated.

Instead, a solution is to use a GADT to provide a constructor with the given constraints.

## Error Message
```
IllegalDatatypeContext.hs:5:6: error: [GHC-87429]
    Illegal datatype context (use DatatypeContexts): (Show a,
                                                      Read a) =>
  |
5 | data (Show a, Read a) => D a = D a
  |      ^^^^^^^^^^^^^^^^
```
