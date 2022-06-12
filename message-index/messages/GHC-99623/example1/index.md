---
title: Import item suggests constructors/methods
---

When importing `TypeWithoutVisibleCtrs` from `module HiddenConstructors`, the import list item in `module DodgyImports` suggests that this type has associated in-scope constructor(s). However it does not (the constructors are out of scope). The same is true of `TypeWithNoCtrs`; the import item suggests it has constructors whereas it has none (either in or out of scope).

The solution is to import the type abstractly (without `(..)`) to match its exporting.

## Error Message
```
DodgyImports.hs:3:1: warning: [-Wdodgy-imports] [GHC-99623]
    The import item ‘TypeWithoutVisibleCtrs(..)’ suggests that
    ‘TypeWithoutVisibleCtrs’ has (in-scope) constructors or class methods,
    but it has none
  |
3 | import HiddenConstructors ( TypeWithoutVisibleCtrs(..), TypeWithNoCtrs(..) )
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

DodgyImports.hs:3:1: warning: [-Wdodgy-imports] [GHC-99623]
    The import item ‘TypeWithNoCtrs(..)’ suggests that
    ‘TypeWithNoCtrs’ has (in-scope) constructors or class methods,
    but it has none
  |
3 | import HiddenConstructors ( TypeWithoutVisibleCtrs(..), TypeWithNoCtrs(..) )
```
