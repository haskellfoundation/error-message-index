---
title: A module is inferred as safe but not annotated as safe
---

In this example the module has been inferred to be safe, but not annotated as such.
If the module is annotated, the warning disappears.

```
messages/GHC-58656/inferred-safe/before/InferredSafe.hs:2:17: warning: [GHC-58656] [-Wsafe]
    ‘InferredSafe’ has been inferred as safe!
  |
2 | {-# OPTIONS_GHC -fwarn-safe #-}
  |
```
