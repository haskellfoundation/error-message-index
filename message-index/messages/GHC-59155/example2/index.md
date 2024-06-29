---
title: Illegal unboxed tuple section
---

## Error message

```
IllegalTupleSection.hs:7:7: error: [GHC-59155]
    Illegal tuple section
    Suggested fix:
      Perhaps you intended to use the ‘TupleSections’ extension
  |
7 | foo = (# 1, #)
  |       ^^^^^^^^
```
