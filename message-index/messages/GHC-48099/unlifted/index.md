---
title: Unlifted top-level binding
---

## Message

```
Unlifted.hs:4:1: error: [GHC-48099]
    Top-level bindings for unlifted types aren't allowed: x = 4#
  |
4 | x = 4#
  | ^^^^^^
```

## Explanation

Top-level bindings are not allowed to be unlifted types, because they always need to be a [thunk](https://wiki.haskell.org/Thunk). To fix the issue, use a lifted type.
