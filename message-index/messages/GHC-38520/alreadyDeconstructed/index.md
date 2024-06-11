---
title: Already deconstructed
---

## Warning message

```
AlreadyDeconstructed.hs:5:15: warning: [-Wredundant-bang-patterns]
    Pattern match has redundant bang
    In an equation for ‘doubleIfTrue’: doubleIfTrue x = ...
  |
5 | doubleIfTrue !x         = fst x
  |               ^
```

## Explanation

It is possible that a previous match clause already forced the evaluation of a value,
just to reject it and try later patterns.
For example, `doubleIfTrue`'s first clause already deconstructs the pair tuple, so
a bang pattern on the tuple as a whole has no effect in the second clause.
