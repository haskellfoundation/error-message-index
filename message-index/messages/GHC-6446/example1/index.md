---
title: Do notation in pattern match
---

When pattern matching, `do` blocks are not allowed as expressions to be pattern matched against.

## Error Message
```
DoNotationInPattern.hs:4:4: error: [GHC-6446]
    do-notation in pattern
  |
4 | f (do a; b; c;) = do
  |    ^^^^^^^^^^
```
