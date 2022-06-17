---
title: Command syntax in pattern
summary: Arrow command syntax was used in a pattern.
severity: error
introduced: 9.6.1
extension: Arrows
---

[Arrows](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/arrows.html) are an abstraction for computations that has special syntactic support in GHC.
When the `Arrows` extension is enabled, some expressions that would normally be interpreted as containing the infix operators `-<` and `-<<` are instead interpreted as a new syntactic category of _commands_.
These commands do not make sense as patterns, and using them in a pattern context is an error.
