---
title: Safe head of a list
---

The case for the empty list is missing, and for a safe version of head, the return type has to be changed.

## Error Message

```
Main.hs:4:1: warning: [-Wincomplete-patterns]
    Pattern match(es) are non-exhaustive
    In an equation for ‘safeHead’:
        Patterns of type ‘[a]’ not matched: []
  |
3 | safeHead (x : xs) = x
  | ^^^^^^^^^^^^^^^^^^^^^
```
