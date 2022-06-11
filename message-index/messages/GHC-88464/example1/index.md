---
title: Mistaken variable scope
---

In this example, the body of `g` attempts to refer to `x`, which is an argument to `f` and thus not available. The updated version renames `g`'s argument so that the `x` in the body can refer to it.
