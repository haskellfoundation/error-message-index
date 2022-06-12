---
title: Missing space after tilde `~`
summary: Lazy pattern in expression context
severity: error
introduced: 9.6.1
---

The `~` character can be used for multiple purposes:
- For type equality in a function signature `a ~ b`
- As a binary operator `(~) :: a -> b -> c`
- As a *lazy pattern* when defining fields or variable bindings `let ~l = ...`

If no space is placed between `~` and the expression that follows it, this is interpreted as the last bullet; in expression contexts, the lazy pattern is not allowed. The most likely case is that you wish to use `~` as a binary operator, in which case a space is needed following it.
