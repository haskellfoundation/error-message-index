---
title: Numeric escape sequence out of range
summary: The numeric escape sequence represents a number that is too large
introduced: 9.6.1
severity: error
---

The escape sequence in the `Char` literal is too large of a number. The maximum value of a numeric literal is `\1114111`
(or `\x10ffff` in hexadecimal and `\o4177777` in octal).
