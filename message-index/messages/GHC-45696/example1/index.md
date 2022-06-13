---
title: If-Then-Else in pattern match
---

When pattern matching, `(if .. then .. else)` expressions are not allowed as patterns to be matched against.

In this example, if `a` is `True` then we want to pattern match `b` to `"something"`; if `a` is `False`, we want to pattern match `b` with `"something else"` instead. For instance, `f True "something else"` is `False` and `f False "something else"` is `True`.

However we cannot use an `if` expression within a pattern match; the solution can be to either to match on a tuple of `(a, b)` or to move the `if` expression outside of the pattern.

## Error Message

```
IfThenElseInPattern.hs:5:6: error: [GHC-45696]
    (if ... then ... else ...)-syntax in pattern
  |
5 |     (if a then b == "something" else b == "something else") -> True
  |      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
