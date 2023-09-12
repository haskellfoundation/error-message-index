---
title: Module is inferred to be safe
summary: If a module is inferred as safe, then it should be annotated as safe
severity: warning
flag: -Wsafe
introduced: 9.6.1
---

GHC implements the `SafeHaskell` extension which allows programmers to restrict modules to a specific subset which is considered safe and does not contain loopholes such as `unsafePerformIO`.
More details are available in [the GHC User's Guide](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/safe_haskell.html).
The compiler can automatically infer whether a given module is safe or not.
GHC can emit a warning if a module is inferred to be safe, but not annotated as safe.
