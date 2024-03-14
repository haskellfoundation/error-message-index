---
title: "`head` is a partial function"
---

## Error Message

```
before/PartialHead.hs:6:3: warning: [GHC-63394] [-Wx-partial]
    In the use of ‘head’
    (imported from Prelude, but defined in GHC.List):
    "This is a partial function, it throws an error on empty lists. Use pattern matching or Data.List.uncons instead. Consider refactoring to use Data.List.NonEmpty."
  |
6 |   head list
  |   ^^^^
```
