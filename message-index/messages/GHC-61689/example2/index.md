---
title: Importing a field selector that has been disabled with NoFieldSelectors.
---

## Message
```
NoFieldSelectors.hs:3:24: error: [GHC-61689]
    Module ‘A’ does not export ‘fint’.
    Suggested fix:
      Notice that ‘fint’ is a field selector belonging to the type ‘A.Foo’
      that has been suppressed by NoFieldSelectors.
  |
3 | import A (Foo (MkFoo), fint)
  |                        ^^^^
```

## Explanation

With `FieldSelectors` (the default), field selectors are exported such that the following two imports are equivalent:

```haskell

import A (Foo (MkFoo, fint))
import A (Foo (MkFoo), fint)
```

With `NoFieldSelectors` at the _definition site_ (`A.hs`), the second example is always an error:

```haskell
import A (Foo (MkFoo), fint)
```

The fix is to move the selector import to the type or remove it altogether.
