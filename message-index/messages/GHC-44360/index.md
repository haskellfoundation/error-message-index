---
title: Cannot import unsafe modules in Safe Haskell
summary: Only safe modules can be imported in modules which are declared safe
severity: error
introduced: 9.6.1
---

GHC implements the `SafeHaskell` extension which allows programmers to restrict modules to a specific subset which is considered safe and does not contain loopholes such as `unsafePerformIO`. More details are available in [the GHC User's Guide](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/safe_haskell.html).
In order to uphold the guarantees of Safe Haskell, GHC does not allow modules which are declared safe to import unsafe modules.
