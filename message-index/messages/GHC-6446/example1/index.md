---
title: Do notation in pattern match
summary: Do notation in pattern match
severity: error
introduced: 9.6.1
---

When pattern matching, `do` blocks are not allowed as expressions to be pattern matched against.

## Error Message
```
DoNotationInPattern.hs:4:4: error:
    do-notation in pattern
  |
4 | f (do a; b; c;) = do
  |    ^^^^^^^^^^
```
