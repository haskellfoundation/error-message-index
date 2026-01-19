---
title: GHC does not support defining static pointers in splices
---

You can't use a static forms in a splice - i.e. you can't obtain a `StaticPtr`
in code that runs at compile time.

Evaluating a quote that has a static form is not a problem, since this is code
that will be evaluated at run time.
