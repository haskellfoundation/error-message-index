---
title: Illegal unboxed string literal in pattern
summary: Illegal unboxed string literal in pattern.
severity: error
introduced: 9.6.1
---

When pattern matching, unboxed string literals (with the [MagicHash](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/magic_hash.html?highlight=magichash) postfix) are not allowed. Unboxed string literals are essentially C strings allocated outside of the Haskell heap, and they evaluate to pointers to the resulting strings. Thus,`"foo"#` is of type `Addr#`. While `eqAddr#` can be used to compare these pointers, two identically-written unboxed string literals typically do not point the same address.

