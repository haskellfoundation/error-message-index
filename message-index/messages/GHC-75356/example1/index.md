---
title: Export item suggests constructors/methods
---

When re-exporting `TypeWithoutVisibleCtrs` *originally imported* from `module HiddenCtrs` and then *re-exported* in `module DodgyExports`, the export list item suggests that this type has associated in-scope constructor(s). However it does not (the constructors are out of scope). The same is true of `TypeWithNoCtrs`; the export item suggests it has constructors whereas it has none (either in or out of scope).

The solution is to export the type abstractly (without `(..)`).

## Error Message
```
DodgyExports.hs:1:22: warning: [-Wdodgy-exports] [GHC-75356]
    The export item ‘TypeWithoutVisibleCtrs(..)’ suggests that
    ‘TypeWithoutVisibleCtrs’ has (in-scope) constructors or class methods,
    but it has none
  |
1 | module DodgyExports (TypeWithoutVisibleCtrs(..), TypeWithNoCtrs(..)) where
  |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^

DodgyExports.hs:1:50: warning: [-Wdodgy-exports] [GHC-75356]
    The export item ‘TypeWithNoCtrs(..)’ suggests that
    ‘TypeWithNoCtrs’ has (in-scope) constructors or class methods,
    but it has none
  |
1 | module DodgyExports (TypeWithoutVisibleCtrs(..), TypeWithNoCtrs(..)) where
  |                                                  ^^^^^^^^^^^^^^^^^^
```
