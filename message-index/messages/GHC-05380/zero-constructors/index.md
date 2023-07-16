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

A `newtype` definition is required to have exactly one constructor, so constructorless `newtype`s are not allowed.
Datatypes defined using `data` are allowed to be constructorless,
so this problem can be fixed either by adding a constructor to the `newtype`
or by changing the `newtype` keyword to a `data` keyword.
