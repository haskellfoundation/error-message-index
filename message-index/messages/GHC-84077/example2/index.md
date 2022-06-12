---
title: Missing space in type application
---

## Error Message

```
Example.hs:7:5: error:
    @-pattern in expression context: g@Int
    Type application syntax requires a space before '@'
  |
7 | f = g@Int
  |     ^^^^^
```

## Explanation

A space is missing before the type application. The expression cannot be correctly parsed.
