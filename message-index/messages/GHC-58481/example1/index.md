---
title: Parse error expression
---

Error in expression - `module` keyword should not be used in the same line as an expression declaration.

## Error Message
```
error: [GHC-58481]
    parse error on input ‘module’
  |
5 | foo = 123456                    module
  |                                 ^^^^^^
```
