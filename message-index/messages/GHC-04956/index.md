---
title: Can't derive instances of nullary classes
summary: It is not possible to derive instances of argumentless type classes without the DeriveAnyClass extension.
introduced: 9.6.1
severity: error
---

With a clever combination of stand-alone deriving and an explicit deriving strategy, it is possible to get GHC to attempt to derive a type class instance for a nullary (that is, zero-argument) typeclass using a technique that works only for typeclasses with arguments.
