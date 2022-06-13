---
title: TITLE HERE
---

BODY HERE

## Error Message
```
 warning: [-Woperator-whitespace-ext-conflict] [GHC-47082]
    The prefix use of a ‘$’ would denote an untyped splice
      were the TemplateHaskell extension enabled.
    Suggested fix: Add whitespace after the ‘$’.
  |
3 | f = $(x)
  |     ^

error: [GHC-58481]
    parse error on input ‘$’
    Suggested fix: Perhaps you intended to use TemplateHaskell
  |
3 | f = $(x)
  |     ^
```
