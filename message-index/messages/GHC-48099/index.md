---
title: Top-level strict or unlifted binds not allowed
summary: Top-level bindings may not be strict, and they may not have unlifted types.
introduced: 9.6.1
severity: error
---

In Haskell, top-level bindings must be represented by [thunks](https://wiki.haskell.org/Thunk) because the evaluation time of things that can fail is hard to understand when they're part of a module. This rules out strict bindings as well as unlifted bindings.
