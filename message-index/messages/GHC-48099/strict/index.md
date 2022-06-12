---
title: Top-level strict bindings
---

## Message

```
Strict.hs:3:1: error: [GHC-48099]
    Top-level strict bindings aren't allowed: !x = 5
  |
3 | !x = 5
  | ^^^^^^
```

## Explanation

The top-level binding of `x` is a strict pattern, which is not allowed. This can be fixed by not having a strict pattern for a top-level binding.
