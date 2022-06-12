---
title: Data constructor not imported
---

The import statement `import Foo (Bar)` imports the `Bar` data type, but no its constructor `MkBar`.
As such, the constructor is not in scope.

## Error Message

```
IncorrectImport.hs:6:12: error: [GHC-76037]
    Not in scope: data constructor ‘MkBar’
  |
6 | barAddOne (MkBar n) = MkBar (n + 1)
  |            ^^^^^
```
