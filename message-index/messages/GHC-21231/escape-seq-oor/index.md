---
title: "Typo: lower-case class name"
---

## Error Message

```
EscapeSeqOutOfRange.hs:4:13: error:
    numeric escape sequence out of range at character '2'
  |
4 | x = '\1114112'
  |             ^
```
## Explanation

This example shows that a numeric escape sequence with a value higher than 
`1114111` throws an error, but numbers lower than that don't.
