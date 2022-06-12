---
title: Missing space after exclamation `!`
---

There is no space after the exclamation mark character `!`.

## Error Message

```
MissingSpaceBangPattern.hs:9:9: error: [GHC-95644]
    Bang pattern in expression context: !1
    Did you mean to add a space after the '!'?
  |
9 | f x = x !1
  |
```
