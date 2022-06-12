---
title: Missing space after exclamation mark `!`
summary: Bang pattern in expression context.
severity: error
introduced: 9.6.1
---

The `!` character can be used for multiple purposes:

- As a binary operator: `(!) :: a -> b -> c`
- As a *strictness flag* when defining fields: `data Foo = MkFoo !Int Char`
- To write strict let bindings: `let !b = undefined in (True, b)`
- As a *bang pattern* to make patterns stricter: `let (!a,b) = (undefined, True) in b || a`

If no space is placed between `!` and the expression that follows it, this is interpreted as the last bullet; in expression contexts, the bang pattern is not allowed. The most likely case is that you wish to use `!` as a binary operator, in which case a space is needed following it.
