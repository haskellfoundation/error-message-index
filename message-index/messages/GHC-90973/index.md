---
title: Exported module not imported
summary: Export list contains a module that is not imported
severity: error
introduced: 9.6.1
---

An *Export List* of a Haskell module identifies the entities (functions, types, etc.) to be exported by a module declaration.
The syntax for export lists is described in the [section 5.2](https://www.haskell.org/onlinereport/modules.html) of the **Haskell 98 Language and Libraries** report. Apart from exporting individual functions and data types, the specification also allows you to re-export entire modules as in this example:

```haskell
module My.List.Reexport (module Data.List) where

import Data.List

...
```

This tells GHC to include all the symbols exported by the module `Data.List` to also be exported by `My.List.Reexport` module.

The error message `GHC-90973` occurs when module's export list contains a module export of a module, which hasn't been imported.

The usual way to fix it is to either:

1. add the missing module import
2. remove the `module <MISSING-MODULE>` export from the export list
