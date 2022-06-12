---
title: Duplicate export
---

The module `Example` mentions the symbol `answer` twice in its export list.

To avoid the warning, simply remove the duplicated mention.

## Error Message

```
Main.hs:3:25: warning: [-Wduplicate-exports] [GHC-47854]
    ‘answer’ is exported by ‘answer’ and ‘answer’
  |
3 | module Example (answer, answer) where
  |                         ^^^^^^
```
