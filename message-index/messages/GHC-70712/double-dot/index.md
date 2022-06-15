---
title: Double dots in record update
---

## Message
```
DoubleDot.hs:6:17: error: [GHC-70712]
    You cannot use `..' in a record update
  |
6 | y = x {field=8, ..}
  |                 ^^
```

## Explanation
The double-dot syntax is not allowed as part of a record update. To fix the issue, remove the `..` from the record update.
