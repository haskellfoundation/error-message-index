---
title: Redundant catchall pattern
---

## Message
```
Overlapping.hs:6:1: warning: [GHC-53633] [-Woverlapping-patterns]
    Pattern match is redundant
    In an equation for ‘f’: f _ = ...
  |
6 | f _ = False
  | ^^^^^^^^^^^
```

## Explanation

In this case, all the patterns that can match a list were matched in the prior patterns, so the catch-all pattern in the last case will never be matched and is dead code.
