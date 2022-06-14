---
title: Parse error in OPAQUE pragma
---

OPAQUE pragma is incorectly parsed. 

## Error Message
```
error: [GHC-58481]
    parse error on input ‘[’
  |
4 | {-# OPAQUE[1] f #-}
  |           ^
```
