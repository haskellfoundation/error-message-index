---
title: Action without side effect is completely ignored in pure monadic code
---

# Error message

```
list/before/List.hs:6:3: warning: [GHC-81995] [-Wunused-do-bind]
    A do-notation statement discarded a result of type ‘Integer’
    Suggested fix: Suppress this warning by saying ‘_ <- return 1’
  |
6 |   return 1 -- This action has no side effects and is completely ignored.
  |   ^^^^^^^^
```
