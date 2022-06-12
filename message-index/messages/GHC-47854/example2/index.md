---
title: Duplicate field export
---

The module `Example` exports the symbol `answer` twice.
In addition to the explicit entry in the export list it's also exported by `Example(..)`.

To avoid the warning, remove one of the duplicated mention.

## Error Message

```
Main.hs:1:25: warning: [-Wduplicate-exports] [GHC-47854]
    ‘answer’ is exported by ‘Example(..)’ and ‘answer’
  |
1 | module Example (answer, Example(..)) where
  |                        ^^^^^^
```
