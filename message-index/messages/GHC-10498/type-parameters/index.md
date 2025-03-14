---
title: Duplicate datatype parameters
---

```
Lib.hs:3:11: error: [GHC-10498]
    Conflicting definitions for ‘a’
    Bound at: Lib.hs:3:11
              Lib.hs:3:13
  |
3 | data Pair a a = Pair a a
  |
```
