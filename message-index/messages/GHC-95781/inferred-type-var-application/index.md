---
title: Type application with type variable marked as inferred
---

The type annotation `forall {k} ...` of `C` marks the type variable `k` as inferred with the surrounding braces.
In the type application `C @Type @Int Proxy`, the type/kind argument `@Type` is therefore bound to `a` rather than `k`, causing the application to the second type argument `@Int` to throw an error.

Removing the braces around `k` allows `C` to be applied to both type arguments.

## Error Message

```
InferredTypeVarApplication.hs:11:15: error: [GHC-95781]
    • Cannot apply expression of type ‘Proxy (*) -> T (*)’
      to a visible type argument ‘Int’
    • In the expression: C @Type @Int Proxy
      In an equation for ‘x’: x = C @Type @Int Proxy
      In the expression: let x = C @Type @Int Proxy in ()
   |
11 | bar = let x = C @Type @Int Proxy
   |               ^^^^^^^^^^^^^^^^^^
```
