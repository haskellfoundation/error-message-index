---
title: Illegal kind signature for Void1 data type
order: 0
---

In this example, the data type declaration for the `Void1` data type was annotated with the kind signature `* %1 -> *`.
This would be a linear kind, which Haskell does not support - only types may be linear.
The kind signature of the data type should be `* -> *`.

```
messages/GHC-13218/illegalKindSignature/before/IllegalKindSignature.hs:4:1: error: [GHC-13218]
    • Illegal linear function in a kind: * %1 -> *
    • In the data type declaration for ‘Void1’
  |
4 | data Void1 :: * %1 -> *
  | ^^^^^^^^^^
```
