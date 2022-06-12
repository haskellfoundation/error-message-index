---
title: Illegal unboxed string literal in pattern
summary: Illegal unboxed string literal in pattern
severity: error
introduced: 9.6.1
---

When pattern matching, unboxed string literals (with the `MagicHash` postfix) are not allowed. Unboxed string literals are essentially C strings allocated outside of the Haskell heap, and they evaluate to pointers to the resulting strings. Thus,`"foo"#` is of type `Addr#`. While `eqAddr#` can be used to compare these pointers, two identically-written unboxed string literals typically do not point the same address.".

Instead, consider using the unboxed function that implements equality (`eqAddr#`) which can then be used in combination with `if .. then .. else` via `isTrue#`.
