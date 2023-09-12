---
title: A module was annotated as trustworthy, but inferred as safe
---

In this example the module was annotated as trustworthy, but GHC inferred that the module is also safe.
Since "safe" is a stronger guarantee than "trustworthy", GHC warns that the module should be annotated as safe instead.
The warning can therefore be fixed by changing the annotation from trustworthy to safe.

```
messages/GHC-19244/trustworthy-safe/before/TrustworthySafe.hs:1:27: warning: [GHC-19244] [-Wtrustworthy-safe]
    ‘TrustworthySafe’ is marked as Trustworthy but has been inferred as safe!
  |
1 | {-# LANGUAGE Haskell2010, Trustworthy #-}
  |
```
