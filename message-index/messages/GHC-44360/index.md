---
title: Cannot import unsafe modules in safe Haskell
summary: Only safe modules can be imported in modules which are declared safe
severity: error
introduced: 9.6.1
---

GHC implements the SafeHaskell extension which allows programmers to restrict modules to a specific subset which is considered safe.
In order to uphold the guarantees of SafeHaskell, GHC does not allow modules which are declared safe to import unsafe modules.
