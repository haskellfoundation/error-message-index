---
title: Type signature lacks an accompanying binding
---

If a type signature is given for a name in a Haskell module, then the name also needs to be defined.

In this example, the programmer misspelt the name `factorial`.
GHC helpfully suggests that `fatcorial` might be the intended spelling.
The error can be fixed by correcting the typo.

## Error Message

```
MissingBinding.hs:5:1: error: [GHC-44432]
    The type signature for ‘factorial’ lacks an accompanying binding
    Suggested fix: Perhaps use ‘fatcorial’ (Defined at Main.hs:6:1)
  |
5 | factorial :: Natural -> Natural
  | ^^^^^^^^^
```
