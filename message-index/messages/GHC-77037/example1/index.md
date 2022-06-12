---
title: Importing Data.Maybe (Maybe(..))
---

In the example, the import statement brings all the constructors of the `Maybe` data type into scope, without mentioning them explicitly.
The warning can be fixed by explicitly importing the constructors of the `Maybe` data type.

## Warning Message

```
example1/before/Example.hs:4:1: warning: [-Wmissing-import-lists] [GHC-77037]
    The import item ‘Maybe(..)’ does not have an explicit import list
  |
4 | import Data.Maybe (Maybe(..))
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
