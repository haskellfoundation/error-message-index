---
title: operator-whitespace
summary: An optional warning for detecting usage of infix, suffix or prefix operators that could be parsed differently in future due to whitespace, this warning is disabled by default
severity: warning
flag: -Wall, -Wcompat, or -Woperator-whitespace
introduced: 9.6.1
---

GHC distinguishes between a few different occurences for operators depending on whitespace.
An operator can occur in the following ways:

```
a ! b   -- a loose infix occurrence
a!b     -- a tight infix occurrence
a !b    -- a prefix occurrence
a! b    -- a suffix occurrence
```
A loose infix occurrence will always be treated as an operator wheres any of the remaining cases can be redefined by some future language extension.

Consider `-XBangPatterns`

```
a ! b = <rhs>  -- Infix (!)
f !a = <rhs>   -- Bang pattern
```

the above code is possible today, whereas

```
a +b = <rhs>
```

would break if a language extension that introduces a prefix occurence for plus is introduced.

The documentation for the -Woperator-whitespace flag can be found in the [GHC user guide](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/using-warnings.html?highlight=whitespace#ghc-flag--Woperator-whitespace)

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
