---
title: Incorrect TemplateHaskell syntax using ''
introduced: 9.6.1
severity: error
---

An empty pair of single quotes is not a Haskell character literal.

When Template Haskell is enabled, `''T` is syntax that refers to a quoted name of the type `T`. In this case, `''` is not an empty character literal, but rather part of the quotation syntax for type names. Read more at [TemplateHaskellQuotes](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/template_haskell.html#extension-TemplateHaskellQuotes).

In this context, GHC chooses to interpret `''` as an empty character literal rather than as an incomplete quoted type name, which results in this message.

## Example error text

```
error: [GHC-11861]
    Parser error on `''`
    Character literals may not be empty
    Suggested fix:
      Perhaps you intended to use quotation syntax of TemplateHaskell,
      but the type variable or constructor is missing
  |
6 |   where foo = ''
  |               ^^
  ```

