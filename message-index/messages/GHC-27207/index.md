---
title: Missing space after tilde `~`
summary: Lazy pattern in expression context.
severity: error
introduced: 9.6.1
---

The `~` character can be used for multiple purposes:

- For type equality in a function signature: `a ~ b`
- As a binary operator: `(~) :: a -> b -> c`
- For defining non-strict fields in the presence of the `StrictData` extension: `data Foo = MkFoo Int ~Char`
- For making *irrefutable* pattern matches lazy again in the presence of the `Strict` extension: `f ~x = 5`
- As a *lazy pattern* to turn refutable patterns into irrefutable patterns: `case undefined of ~(a,b) -> length [a,b]`

If no space is placed between `~` and the expression that follows it, this is interpreted as the last bullet; in expression contexts, the lazy pattern is not allowed. The most likely case is that you wish to use `~` as a binary operator, in which case a space is needed following it.
