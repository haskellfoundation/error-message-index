---
title: Messages from WARNING and DEPRECATED pragmas
summary: Warning or deprecation message attached to a function, class, type, or module in a library
severity: warning
introduced: 9.6.1
---

Libraries may attach warning messages to functions and other entities they
export to appear when they are used. Common use cases include deprecated
functions and partial functions (such as `head` and `tail`).

Those messages are declared using the pragmas `{-# WARNING ... #-}` and
`{-# DEPRECATED ... #-}`.
For more information, [see the GHC user's guide][users-guide].

[users-guide]: https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/pragmas.html#warning-and-deprecated-pragmas

```haskell
{-# WARNING in "x-partial" head "This function is partial..." #-}
head :: [a] -> a
```
