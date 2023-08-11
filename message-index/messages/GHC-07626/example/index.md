---
title: Parse error in pattern
---

This error occurs because we haven’t properly pattern matched on the list in our definition of the `merge` function. In particular, the parentheses are missing. The type here is a list, which means our options are to match on either the empty list, `[]`, or a list with head and tail, `(a:as)`. By omitting the parentheses around `a:as`, the compiler reads this as an argument, `a`, followed by a misplaced infix cons `(:)` operator, rather than considering the `:` to be part of the list being matched. 

#  Error Message
```
Example.hs:5:1: error: [GHC-07626] Parse error in pattern: merge
  |
5 | merge a:as (b:bs) rest
  | ^^^^^^^

```
