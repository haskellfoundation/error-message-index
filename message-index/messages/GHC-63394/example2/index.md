---
title: "`tail` is a partial function"
---

## Error Message

```
PartialTail.hs:6:3: warning: [GHC-63394] [-Wx-partial]
    In the use of ‘tail’
    (imported from Prelude, but defined in GHC.List):
    "This is a partial function, it throws an error on empty lists. Replace it with drop 1, or use pattern matching or Data.List.uncons instead. Consider refactoring to use Data.List.NonEmpty."
  |
6 |   tail list
  |   ^^^^
```
