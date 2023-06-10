---
title: Tuple section in pattern
summary: There has been an attempt to pattern match on a tuple section.
severity: error
introduced: 9.6.1
---

[Tuple sections](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/tuple_sections.html) are a concise syntax for functions that result in tuples. The missing expressions in the tuple become arguments to the function. Because tuple sections always result in functions, and functions cannot be matched in patterns, tuple sections are not allowed in patterns.

## Example Text

```
Tuple section in pattern context
``` 
