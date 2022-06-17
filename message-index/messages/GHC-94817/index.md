---
title: Tab character
summary: A tab character occurred in the input file.
flag: "-Wtabs"
introduced: 9.6.1
severity: warning
---

Haskell's syntax is indentation-sensitive, which means that that a line's indentation is syntactically meaningful.
Two characters are allowed for indentation: spaces and tabs.
However, tab characters are defined [in the Haskell 2010 report](https://www.haskell.org/onlinereport/haskell2010/haskellch10.html) to insert enough spaces to reach the next column whose number is a multiple of 8.
This does not match the way that many editors and other environments render tab characters, so without great care, the use of tabs can lead to confusing syntax errors.
In particular, GHC may end up interpreting two lines that visually appear to have the same amount of indentation as being indented differently, or two lines that visually appear to be indented differently as having the same indentation.

