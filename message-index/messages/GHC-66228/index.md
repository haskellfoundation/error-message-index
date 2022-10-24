---
title: View pattern in expression context
summary: A view pattern was used in an expression, rather than a pattern.
extension: ViewPatterns
introduced: 9.6.1
---

A [view pattern](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/view_patterns.html) allows pattern matching on the result of a function.
While most kinds of patterns look just like the expressions that construct the data that the pattern recognizes, view patterns don't correspond directly to an expression.
This means that using them where an expression is expected is an error.
