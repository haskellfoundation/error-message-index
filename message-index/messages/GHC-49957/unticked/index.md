---
title: Unticked promoted constructor
---

## Warning
```
Unticked.hs:5:10: warning: [-Wunticked-promoted-constructors] [GHC-49957]
    Unticked promoted constructor: True.
    Suggested fix: Use 'True instead of True.
  |
5 | type A = True
  |          ^^^^
```

## Explanation

`True` is a data constructor for type `Bool`. Here, it is used in a type synonym, which implicitly promotes it to a type constructor of kind `Bool`. The warning can be resolved by adding the tick mark.
