---
title: Operator whitespace
summary: An optional warning for detecting usage of infix, suffix or prefix operators that could be parsed differently in future due to whitespace.
severity: warning
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
A loose infix occurrence will always be treated as an operator, whereas any of the remaining cases may be redefined by a future language extension.

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

The documentation for the `-Woperator-whitespace` flag can be found in the [GHC user guide](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/using-warnings.html?highlight=whitespace#ghc-flag--Woperator-whitespace)
