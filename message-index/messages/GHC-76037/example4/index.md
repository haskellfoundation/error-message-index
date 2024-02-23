---
title: Field selector exported with NoFieldSelectors
---

## Error Message

```
NoFieldSelectorsExport.hs:3:35: error: [GHC-76037]
    Not in scope: ‘foo’
    Suggested fix:
      Notice that ‘foo’ is a field selector belonging to the type ‘T’
      that has been suppressed by NoFieldSelectors.
  |
3 | module NoFieldSelectorsExport (T, foo) where
  |                                   ^^^
```

## Explanation

The field selector `foo` has been disabled via `NoFieldSelectors`, therefore it cannot be a top-level export. The fix is to export it as part of its type `T` (consequently it can be imported for e.g. record creation or updates).
