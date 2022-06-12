---
title: Do notation in pattern match
---

When pattern matching, `do` expressions are not allowed as patterns to be matched against.

## Error Message
```
DoNotationInPattern.hs:4:4: error: [GHC-06446]
    do-notation in pattern
  |
4 | f (do a; b; c;) = do
  |    ^^^^^^^^^^
```
