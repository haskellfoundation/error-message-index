---
title: Module is inferred to be safe
summary: If a module is inferred as safe, then it should be annotated as safe
severity: warning
flag: -Wsafe
introduced: 9.6.1
---

GHC implements the SafeHaskell extension which allows programmers to restrict modules to a specific subset which is considered safe.
The compiler can automatically infer whether a given module is safe or not.
GHC can emit a warning if a module is inferred to be safe, but not annotated as safe.
