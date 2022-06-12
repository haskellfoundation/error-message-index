---
title: Illegal unboxed string literal in pattern
summary: Illegal unboxed string literal in pattern
severity: error
introduced: 9.6.1
---

When pattern matching, unboxed string literals (with the `MagicHash` postfix) are not allowed. `"foo"#` is of type `Addr#` -- that is, "An arbitrary machine address assumed to point outside the garbage-collected heap.".

Instead, consider using the unboxed function that implements equality (`eqAddr#`) which can then be used in combination with `if .. then .. else` via `isTrue#`.
