---
title: Two deprecation warnings for same constant
---

In this example, two deprecation warnings have been given for the constant `pi`. This is not allowed, and can be fixed by just specifying one deprecation message.

```
messages/GHC-00711/doubleDeprecation/before/DoubleDeprecation.hs:4:16: error: [GHC-00711]
    Multiple warning declarations for ‘pi’
    also at  messages/GHC-00711/doubleDeprecation/before/DoubleDeprecation.hs:3:16-17
  |
4 | {-# DEPRECATED pi "Chosen approximation turned out to be too imprecise." #-}
  |                ^^
```
