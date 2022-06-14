---
title: operator-whitespace
summary: A warning for detecting usage of infix, suffix or prefix operators that could be parsed differently in the future due to whitespace.
severity: warning
flag: -Wall, -Wcompat, or -Woperator-whitespace
introduced: 9.6.1
---

## Error Message
```

Main.hs:9:10: warning: [-Woperator-whitespace] [GHC-40798]
    The suffix use of a ‘+’ might be repurposed as special syntax
      by a future language extension.
    Suggested fix: Add whitespace around ‘+’.
  |
9 | f a b = a+ b -- this one is a warning
  |          ^

Main.hs:12:11: warning: [-Woperator-whitespace] [GHC-40798]
    The prefix use of a ‘+’ might be repurposed as special syntax
      by a future language extension.
    Suggested fix: Add whitespace around ‘+’.
   |
12 | g a b = a +b -- this one is also a warning
   |           ^

Main.hs:15:10: warning: [-Woperator-whitespace] [GHC-40798]
    The tight infix use of a ‘+’ might be repurposed as special syntax
      by a future language extension.
    Suggested fix: Add whitespace around ‘+’.
   |
15 | h a b = a+b -- this one as well
   |          ^
```
