---
title: Missing FunctionalDependencies language extension
---

Cannot specify functional dependencies for a class - `FunctionalDependencies` language extension is missing.

## Error Message

```
FunDepsDisabled.hs:1:1: error: [GHC-15708]
    • Fundeps in class ‘Convert’
    • In the class declaration for ‘Convert’
    Suggested fix: Perhaps you intended to use FunctionalDependencies
  |
1 | class Convert a b | a -> b where
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^...
```
