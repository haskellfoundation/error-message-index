---
title: Empty character literals
summary: Empty character is not a valid literal 
introduced: 9.6.1
severity: error
---

Empty character wa given in a single quote. This is not a valid literal. If you want to pass a whitechar use explicit space character `' '` or other from the list: newline, vertab, space, tab, uniWhite.

## Example error text

```
 error: [GHC-11861]
    Parser error on `''`
    Character literals may not be empty
  |
4 |   where foo = ''
  |               ^^
  ```

