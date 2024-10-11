---
title: Unlifted and unboxed types
---

## Warning messages

```
UnliftedTypes.hs:17:6: warning: [-Wredundant-bang-patterns]
    Pattern match has redundant bang
    In an equation for ‘foo’: foo a = ...
   |
17 | foo !a !b !c = ()
   |      ^

UnliftedTypes.hs:17:9: warning: [-Wredundant-bang-patterns]
    Pattern match has redundant bang
    In an equation for ‘foo’: foo b = ...
   |
17 | foo !a !b !c = ()
   |         ^

UnliftedTypes.hs:17:12: warning: [-Wredundant-bang-patterns]
    Pattern match has redundant bang
    In an equation for ‘foo’: foo c = ...
   |
17 | foo !a !b !c = ()
   |            ^
```

## Explanation

Forcing the evaluation of a value up to WHNF does not make sense for unlifted and
unboxed types, because these types can never be represented by an unevaluated expression at runtime.
Thus, trying to enforce strictness via a bang pattern has no effect.
