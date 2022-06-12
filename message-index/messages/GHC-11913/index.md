---
title: Illegal deriving item
summary: Something other than a type class appears in a deriving statement.
introduced: 9.6.1
severity: error
---

After a datatype declaration, a `deriving` statement allows programmers to specify type class instances that the compiler should automatically generate. For instance, `deriving (Eq, Show)` will result in a datatype that can be compared for equality and converted to a string with no further code necessary.

For this to make sense, `deriving` needs to be provided with valid type class instances. Just as it doesn't make sense to treat a number as a function, it doesn't make sense to treat ordinary types as instances.
