---
title: A default declaration was provided for Bool
order: 1
---

In this example a default declaration was provided for the type `Bool`.
Since `Bool` does not implement the `Num` type class, we have to remove
the default declaration if we want to compile the program.

# Error message

```
BoolDefaultDeclaration.hs:3:1: error: [GHC-88933]
    • The default type ‘Bool’ is not an instance of ‘Num’
    • When checking the types in a default declaration
  |
3 | default (Bool)
  | ^^^^^^^^^^^^^^
```
