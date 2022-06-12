---
title: Attempted to refer to another function's argument
---

## Error Message

```
Main.hs:5:7: error: [GHC-88464]
    Variable not in scope: x
  |
5 | g y = x
  |       ^
```

## Description
In this example, the body of `g` attempts to refer to `x`, which is an argument to `f` and thus not available. The updated version renames `g`'s argument so that the `x` in the body can refer to it.
