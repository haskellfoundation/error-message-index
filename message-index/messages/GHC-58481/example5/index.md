---
title: Use of overloaded labels without enabled language extension
---

In this examplem the user attempted to use an overloaded label without enabling the `OverloadedLabels` extension, which leads to this generic parsing error. [Overloaded Labels](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/overloaded_labels.html#extension-OverloadedLabels) assign a special meaning to the `#` character in front of an identifier, or (since GHC 9.6) any non-empty double-quoted string.

```
messages/GHC-58481/example5/before/Label.hs:4:7: error: [GHC-58481] parse error on input ‘#’
  |
4 | foo = #foo
  |       ^
```
