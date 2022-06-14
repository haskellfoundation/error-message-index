---
title: Incorrect syntax of ($) operator usage
---

When TemplateHaskell is **not** enabled, then `$` denotes function application, but must be followed with a space character: `"$ "`.

When TemplateHaskell is enabled, `$` denotes a [splice operator](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/template_haskell.html). Used in this context, there must be no space between the “$” and the expression. 

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
