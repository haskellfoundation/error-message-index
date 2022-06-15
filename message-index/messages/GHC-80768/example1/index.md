---
title: Kind signatures on classes must end with Constraint unobscured by type families
---

The problem here is the usage of the type family `Id` in the Stand alone kind signature for the typeclass `C`. It's an error for kind signatures on classes to not end in a "naked" Constraint.

## Error Message
```
ClassKindNotConstraint.hs:14:1: error: [GHC-80768]
    • Kind signature on a class must end with Constraint
      unobscured by type families
    • In the class declaration for ‘C’
   |
14 | class C a
   | ^^^^^^^^^
```
