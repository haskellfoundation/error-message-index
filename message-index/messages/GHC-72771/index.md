---
title: Mismatched default method signature
summary: The provided default method implementation's type signature does not match the corresponding method type signature.
severity: error
introduced: 9.8.1
---

This error means that there is a type class with some method `m` for which a [default signature](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/default_signatures.html) was defined, but that default signature does not match the type signature of `m`.