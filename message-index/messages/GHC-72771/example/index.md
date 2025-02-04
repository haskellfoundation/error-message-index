---
title: Default type signature does not match
---

## Error Message
```
app/Main.hs:10:11: error: [GHC-72771]
    • The default type signature for enum: (Int ~ a) => a
      does not match its corresponding non-default type signature
    • When checking the class method:
        enum :: forall a. Main.Enum a => [a]
      In the class declaration for ‘Main.Enum’
   |
10 |   default enum :: (Int ~ a) => a
   |           ^^^^
```

## Explanation

Here, we have defined an Enum typeclass over some type `a`, its instance `enum` simply has the signature `[a]`.
At the same time, we define a default method for enum, which is applied in case the `a` is of type `Int`.
But, this default method has the type signature `a`, which is not equivalent to `[a]`, therefore this error is thrown.

To resolve this error, we need to define the method signatures to match.
Therefore, we define the default method signature to produce `[a]` instead of `a`.