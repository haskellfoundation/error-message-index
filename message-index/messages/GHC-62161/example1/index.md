---
title: Sum of a list
---

The case for the empty list is missing.


## Error Message

```
Main.hs:4:1: warning: [-Wincomplete-patterns] [GHC-62161]
    Pattern match(es) are non-exhaustive
    In an equation for ‘mySum’:
        Patterns of type ‘[Int]’ not matched: []
  |
2 | mySum (x : xs) = x + mySum xs
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
