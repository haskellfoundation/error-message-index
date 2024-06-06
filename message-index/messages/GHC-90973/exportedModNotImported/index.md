---
title: Exporting module which has not been imported
---

```haskell
ExportedModNotImported.hs:1:32: error:
    The export item ‘module Data.List’ is not imported
  |
1 | module ExportedModNotImported (module Data.List) where
  |
```

We're trying to reexport a module which has not been imported.
In this case we fix it by adding the missing import statement.
