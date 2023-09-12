---
title: Safe module tries to import Unsafe.Coerce
---

This module tries to import the module `Unsafe.Coerce`, even though the module is declared to be safe.
In order to use an unsafe module such as `Unsafe.Coerce`, the annotation which declares the module to be safe has to be removed.

```
messages/GHC-44360/unsafe-import/before/UnsafeImport.hs:4:1: error: [GHC-44360]
    Unsafe.Coerce: Can't be safely imported!
    The module itself isn't safe.
  |
4 | import Unsafe.Coerce
  | ^^^^^^^^^^^^^^^^^^^^
```
