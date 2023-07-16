---
title: More than 1 constructor for a newtype
---

## Error Message
```
Main.hs:1:1: error: [GHC-05380]
    A newtype must have exactly one constructor,
      but ‘Direction’ has two
    In the newtype declaration for ‘Direction’
  |
1 | newtype Direction = Up | Down
  |
```
## Explanation

A `newtype` constructor can only have a single constructor.
It is not allowed to have multiple constructors when defining a `newtype`.
