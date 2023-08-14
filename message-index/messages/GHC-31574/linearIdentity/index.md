---
title: Linear identity function needs LinearTypes extension
---

In this example, the programmer correctly implemented the identity function with a linear type signature.
This type signature correctly states that the identity function uses its argument exactly once.
In order to be able to use this type signature, the extension `LinearTypes` has to be enabled.

```
messages/GHC-31574/linearIdentity/before/LinearIdentity.hs:3:21: error: [GHC-31574]
    Illegal use of linear functions
    Suggested fix: Perhaps you intended to use LinearTypes
  |
3 | linearIdentity :: a %1 -> a
  | 
```
