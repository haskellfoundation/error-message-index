---
title: A usage of (==) on a data type which doesn‘t have an instance for Eq.
---

## Error message

```
Main.hs:4:15: error: [GHC-39999]
    • No instance for (Eq Foo) arising from a use of ‘==’
    • In the expression: foo == A
      In an equation for ‘isA’: isA foo = foo == A
  |
4 | isA foo = foo == A
  |               ^^
```

## Explanation

The operator `==` is only defined on types which have an instance for the `Eq` type class. The data type Foo does not have an instance. So GHC doesn‘t know how to compare values of `Foo`.
To make this example compile we can create an `Eq` instance by using a `derive` statement.
