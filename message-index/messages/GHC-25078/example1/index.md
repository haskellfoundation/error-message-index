---
title: Invalid operator precedence
---

An operator's precedence must be `1 <= x <= 9`.

## Error Message
```
InvalidPrecedence.hs:6:8: error: [ghc-25078]
    Precedence out of range: 1000
  |
6 | infixl 1000 ⊚‿⊚
  |        ^^^^
```
