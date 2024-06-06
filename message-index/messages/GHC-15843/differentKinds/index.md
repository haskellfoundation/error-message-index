---
title: The types have different kinds
---

The types have different kinds. If you are using kind declarations or
annotations, make sure these match. Alternatively, you may have given different
numbers of type arguments to the same type constructor -- make sure the number
of arguments match.

## Example error text

```
X.hs:3:1: error: [GHC-15843]
    • Type constructor ‘X’ has conflicting definitions in the module
      and its hs-boot file.
      Main module: type X :: * -> *
                   data X a = X a
        Boot file: type X :: *
                   data X
      The types have different kinds.
    • In the data type declaration for ‘X’
  |
3 | data X a = X a
  | ^^^^^^^^^^^^^^
```

