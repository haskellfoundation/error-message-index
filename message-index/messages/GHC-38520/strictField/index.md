---
title: Strict fields
---

## Warning message

```
UnliftedTypes.hs:17:6: warning: [-Wredundant-bang-patterns]
    Pattern match has redundant bang
    In an equation for ‘foo’: foo a = ...
   |
17 | foo !a !b !c = ()
   |      ^  
```

## Explanation

Haskell allows a user to annotate fields of a datatype as strict, by prepending
their type with an exclamation mark.
Pattern matching on such a constructor forces it to WHNF, but this also automatically
forces any strict fields to evaluate to WHNF as well.
Thus, a Bang Pattern has no effect on a strict field.
