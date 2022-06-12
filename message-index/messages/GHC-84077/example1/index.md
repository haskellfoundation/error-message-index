---
title: Missing space before type application
---

There is no space before the type application `@Int`.

## Error Message

```
MissingSpaceTypeOperator.hs:6:7: error:
    @-pattern in expression context: x@Int
    Type application syntax requires a space before '@'
  |
6 | f x = x@Int
  |       ^^^^^
```
