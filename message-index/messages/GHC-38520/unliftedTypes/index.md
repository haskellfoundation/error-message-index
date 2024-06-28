---
title: Unlifted and Unboxed Types
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

Forcing the evaluation of a value up to WHNF breaks down with unlifted and
unboxed types, which explicitly lack a wrapping thunk (there is no *box*),
and so values of such types are already always strict.
Thus, trying to enforce strictness via a bang pattern has no effect.
