---
title: Empty character literals
summary: 
introduced: 9.6.1
severity: error
---

Empty character wa given in a single quote. This is not a valid literal. If you want to pass a whitechar use explicit space character `' '` or other from the list: newline, vertab, space, tab, uniWhite.

If you use TemplateHaskell `''T` syntax is valid and:
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

