---
title: Type operator missing an argument
---
## Message
```
missing-argument/before/MissingArgument.hs:6:12: error: [GHC-24180]
    Operator applied to too few arguments: +
  |
6 | example :: + Int
  |            ^
```

## Explanation

Infix type operators require arguments on both sides.
