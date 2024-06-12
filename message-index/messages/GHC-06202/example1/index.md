---
title: Illegal type signature in instance declaration
---

## Error message

Type signatures are only allowed to be in instance declarations when the `InstanceSigs` language extension is enabled.

```
Example1.hs:6:13: error: [GHC-06202]
    • Illegal type signature in instance declaration:
        (==) :: A -> A -> Bool
    • In the instance declaration for ‘Eq A’
    Suggested fix: Perhaps you intended to use InstanceSigs
  |
6 |     (==) :: A -> A -> Bool
```
