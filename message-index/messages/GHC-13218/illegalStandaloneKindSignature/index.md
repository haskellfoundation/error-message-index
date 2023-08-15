---
title: Illegal kind signature for Void1 data type
order: 2
---

This example is similar to the previous two examples, except that the malformed kind was first declared as a type synonym.

```
messages/GHC-13218/illegalStandaloneKindSignature/before/IllegalStandaloneKindSignature.hs:9:1: error: [GHC-13218]
    • Illegal linear function in a kind: * %1 -> *
    • In the expansion of type synonym ‘K’
      In the data type declaration for ‘Void1’
  |
9 | data Void1 :: K
  | ^^^^^^^^^^
```
