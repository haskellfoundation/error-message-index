---
title: Empty character literals
summary: Empty character is not a valid literal 
introduced: 9.6.1
severity: error
---

An empty pair of single quotes is not a valid literal. To indicate a whitespace character, either use an explicit space character `' '` or an escape code such as `'\n'` for a newline.

## Example error text

```
 error: [GHC-11861]
    Parser error on `''`
    Character literals may not be empty
  |
4 |   where foo = ''
  |               ^^
  ```

