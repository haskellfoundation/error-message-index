---
title: No fields updated
---

## Message

```
NoFields.hs:7:6: error: [GHC-20825]
    Empty record update
  |
7 | r2 = r1 {}
  |      ^^^^^
```

## Explanation

No fields were provided in the update to `r1`. Provide a field to fix the error.
