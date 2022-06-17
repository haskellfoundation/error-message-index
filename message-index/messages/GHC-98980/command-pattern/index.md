---
title: A command in a pattern
---
## Message
```
CommandPattern.hs:4:4: error: [GHC-98980]
    Command syntax in pattern: y -< x
  |
4 | f (y -< x) = 5
  |    ^^^^^^
```

## Explanation

In this example, the command `y -< x` is used where a pattern is expected.
To fix the error, replace the command with a pattern.
