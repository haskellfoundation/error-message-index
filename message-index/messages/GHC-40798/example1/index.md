---
title: operator-whitespace
summary: An optional warning for detecting usage of infix, suffix or prefix operators that could be parsed differently in the future due to whitespace, this warning is disabled by default.
severity: warning
flag: -Wall, -Wcompat, or -Woperator-whitespace
introduced: 9.6.1
---

## Error Message
```
Main.hs:7:10: warning: [-Woperator-whitespace] [GHC-40798]
    The suffix use of a ‘+’ might be repurposed as special syntax
      by a future language extension.
    Suggested fix: Add whitespace around ‘+’.
  |
7 | f a b = a+ b
  |          ^

Main.hs:9:11: warning: [-Woperator-whitespace] [GHC-40798]
    The prefix use of a ‘+’ might be repurposed as special syntax
      by a future language extension.
    Suggested fix: Add whitespace around ‘+’.
  |
9 | g a b = a +b
  |           ^

Main.hs:11:10: warning: [-Woperator-whitespace] [GHC-40798]
    The tight infix use of a ‘+’ might be repurposed as special syntax
      by a future language extension.
    Suggested fix: Add whitespace around ‘+’.
   |
11 | h a b = a+b
   |          ^

```
