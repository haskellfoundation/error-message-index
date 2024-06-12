---
title: Illegal type signature in instance declaration
summary: Method in class instance has type signature, but extension InstanceSigs is not enabled
severity: error
introduced: 9.6.1
---

This error is emitted when class instance has type signature, but extension [InstanceSigs](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/instances.html#instance-signatures-type-signatures-in-instance-declarations) is not enabled. Note that `InstanceSigs` is part of `GHC2021` and `GHC2024` [editions](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/control.html), so you won't encounter this error in new code unless you explicitely opt-out.
