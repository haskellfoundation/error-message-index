---
title: Empty character literals
summary: Incorrect TemplateHaskell syntax
introduced: 9.6.1
severity: error
---

An empty pair of single quotes is not a Haskell character literal.

If you use TemplateHaskell `''T` syntax is valid and, following [TemplateHaskellQuotes](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/template_haskell.html#extension-TemplateHaskellQuotes):
> ''T has type Name, and names the type constructor T. That is, ''⟨thing⟩ interprets ⟨thing⟩ in a type context.

Empty literal character error means in that context, that you did not put a constructor name after quotation marks.

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

