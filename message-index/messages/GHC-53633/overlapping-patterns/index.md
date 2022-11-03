---
title: Redundant constructor pattern
---
## Message

```
Overlapping.hs:5:1: warning: [GHC-53633] [-Woverlapping-patterns]
    Pattern match is redundant
    In an equation for ‘f’: f (Just _) = ...
  |
5 | f (Just _) = False
  | ^^^^^^^^^^^^^^^^^^
```

## Explanation

The definition of `f` contains two separate patterns that both match `(Just _)`. This usually indicates a bug, because the second one would be unreachable. This can be fixed by removing the redundant case, but it usually indicates that a change to the program was made quickly and demands more thought.
