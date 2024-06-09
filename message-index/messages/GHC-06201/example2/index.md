---
title: No explicit implementation for method instance 2
---

## Error Message

```
A.hs:8:10: warning: [GHC-06201] [-Wmissing-methods]
    • No explicit implementation for
        either ‘<*>’ or ‘liftA2’
    • In the instance declaration for ‘Applicative Box’
  |
8 | instance Applicative Box where
  |          ^^^^^^^^^^^^^^^
```

## Explanation

The type class `Applicative` requires you to implement at least two methods:

* `pure`, and
* `liftA2` or `multiply` (can also be both).

Such `or` constraints can be expressed via the [`{-# MINIMAL #-}`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/pragmas.html#minimal-pragma) pragma.

To fix this, either implement the method `liftA2` or `<*>`. For this example, we implemented `<*>`, but either or both is fine, too.
