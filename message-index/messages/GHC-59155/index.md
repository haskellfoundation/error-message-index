---
title: Illegal tuple section
summary: A tuple sections is used, but the TupleSections syntax extension is not enabled
severity: error
introduced: 9.6.1
---

One of the components in a tuple is missing, but the `TupleSections` GHC extension has not been enabled. Perhaps this is a typo? If not, and the use of the tuple section syntax is intentional, please enable the extension by adding the following line:

```
{-# LANGUAGE TupleSections #-}
```

at the top of your file.

Please refer to the [`TupleSections` section](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/tuple_sections.html?highlight=tuplesection#extension-TupleSections) page of the GHC user guide to learn more about this syntax extension.
