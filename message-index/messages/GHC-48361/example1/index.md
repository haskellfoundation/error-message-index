---
title: Binding type variables is not allowed in pattern bindings
---

## Error Message

```
Error.hs:9:1: error:
    • Binding type variables is not allowed in pattern bindings
    • In the pattern: Just @a x
      In a pattern binding: Just @a x = Just (5 :: Integer)
  |
9 | Just @a x = Just (5 :: Integer)
  | ^^^^^^^^^
```
