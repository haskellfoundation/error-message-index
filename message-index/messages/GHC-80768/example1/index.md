---
title: Kind signatures on classes must end with Constraint unobscured by type families
---

The problem here is the usage of the type family `Id` in the standalone kind signature for the typeclass `C`. Kind signatures for classes must literally end in `Constraint` rather than in a kind that is equivalent to it.

## Error Message
```
ClassKindNotConstraint.hs:14:1: error: [GHC-80768]
    ā¢ Kind signature on a class must end with Constraint
      unobscured by type families
    ā¢ In the class declaration for āCā
   |
14 | class C a
   | ^^^^^^^^^
```
