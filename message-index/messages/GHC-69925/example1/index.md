---
title: Illegal unboxed string literal in pattern
---

When pattern matching, unboxed string literals (with the `MagicHash` postfix) are not allowed.

## Error Message
```
IllegalUnboxedString.hs:6:5: error: [GHC-69925]
    Illegal unboxed string literal in pattern:
    "a"#
  |
6 |     "a"# -> True
  |     ^^^^
```
