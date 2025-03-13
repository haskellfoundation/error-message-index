---
title: Default type signature does not match
---

## Error Message
```
Lib.hs:10:11: error: [GHC-72771]
    • The default type signature for enumerate: (Int ~ a) => a
      does not match its corresponding non-default type signature
    • When checking the class method:
         enumerate :: forall a. Enumerate a => [a]
      In the class declaration for ‘Enumerate’
   |
10 |   default enumerate :: (Int ~ a) => a
   |           ^^^^^^^^^
```

## Explanation

Here, we have defined an `Enumerate` typeclass over some type `a`, its instance `enumerate` simply has the signature `[a]`.
At the same time, we define a default method for `enumerate`, which is applied in case the `a` is of type `Int`.
But, this default method has the type signature `a`, which is not equivalent to `[a]`, therefore this error is thrown.

To resolve this error, we need to define the default method signature to match the method signature.
Therefore, we define the default method signature to produce `[a]` instead of `a`.
