---
title: Module is annotated as trustworthy, but is inferred as safe
summary: The module is annotated to be trustworthy, but it could be annotated as safe
severity: warning
flag: -Wtrustworthy-safe
introduced: 9.6.1
---

GHC implements the `SafeHaskell` extension which allows programmers to restrict modules to a specific subset which is considered safe, and restricts access to "escape hatches" such as `unsafePerformIO`.
Details about Safe Haskell are available in [the GHC User's Guide](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/safe_haskell.html).
There are two levels of safety: Safe modules are checked by GHC and are guaranteed to be safe, whereas trustworthy modules are checked by
the programmer who promises that the code cannot violate the guarantees of safe Haskell.
If GHC sees a module which is annotated as trustworthy, but inferred as safe, it emits a warning that the stricter "safe" annotation should be used instead.
