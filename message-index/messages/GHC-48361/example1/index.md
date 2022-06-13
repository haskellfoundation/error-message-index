---
title: Binding type variables is not allowed in pattern bindings
---

## Error Message

```
Error.hs:4:1: error: [GHC-48361]
    • Binding type variables is not allowed in pattern bindings
    • In the pattern: Just @a x
      In a pattern binding: Just @a x = Just (5 :: Integer)
  |
4 | Just @a x = Just (5 :: Integer)
  | ^^^^^^^^^
```
