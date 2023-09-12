---
title: Cannot add a rewrite rule for the identity function
---

Wanting to rewrite occurrences of `myId x` to `x` in programs is sensible. But since GHC cannot check in general whether rewrite rules violate the guarantees of SafeHaskell, GHC chooses to ignore all such rules in modules which are annotated as `Safe`.These rewrite rules should therefore be removed.

```
messages/GHC-56147/ignored-rule/before/IgnoredRule.hs:4:11: warning: [GHC-56147]
    Rule "myId" ignored
    Defining user rules is disabled under Safe Haskell
  |
4 | {-# RULES "myId" forall x. myId x = x #-}
  |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
