---
title: Importing an unexported symbol.
---

## Message
```
SymbolNotExported.hs:3:16: error: [GHC-61689]
    Module ‘A’ does not export ‘two’.
  |
3 | import A (one, two)
  |                ^^^
```

## Explanation

The module `SymbolNotExported` imports the symbol `two` even though `A` does not export it.

The fix is to remove the bad import.
