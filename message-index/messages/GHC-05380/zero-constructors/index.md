---
title: Zero constructors for a newtype
---

## Error Message
```
Main.hs:1:1: error: [GHC-05380]
    A newtype must have exactly one constructor, but ‘Void’ has none
    In the newtype declaration for ‘Void’
  |
1 | newtype Void
  |
```

## Explanation

A `newtype` constructor does need to have a single constructor. It is not allowed to
have a newtype without a constructor. It is allowed to have a `data` type without a
constructor, so in order to fix this, you need to come up with a constructor for the newtype
or change the `newtype` keyword to a `data` keyword.
