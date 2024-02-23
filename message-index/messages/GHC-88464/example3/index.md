---
title: Attempted to use a field selector disabled with NoFieldSelectors
---

## Error Message

```
Example3.hs:14:13: error: [GHC-88464]
    Variable not in scope: fint :: Foo -> Int
    Suggested fix:
      Notice that ‘fint’ is a field selector belonging to the type ‘Foo’
      that has been suppressed by NoFieldSelectors.
   |
14 | getFooInt = fint
   |             ^^^^
```

## Description

This example attempts to use the field selector `fint`, despite it being disabled at the definition site (`A.hs`) with `NoFieldSelectors`. This fix is to use pattern matching instead.

Notice that record creation and updates still work with `NoFieldSelectors`.
