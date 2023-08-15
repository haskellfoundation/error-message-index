---
title: Illegal kind signature for Void1 data type
order: 1
---

This example is similar to the previous one, except that instead of the spelling `* %1 -> *`, the spelling `Fun One Type Type` was chosen.
In this case, the signature should be `Fun Many Type Type` instead.

```
messages/GHC-13218/illegalKindSignatureDesugared/before/IllegalKindSignatureDesugared.hs:7:1: error: [GHC-13218]
    • Illegal linear function in a kind: * %1 -> *
    • In the data type declaration for ‘Void1’
  |
7 | data Void1 :: FUN One Type Type
  | ^^^^^^^^^^
```
