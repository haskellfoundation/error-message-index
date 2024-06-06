---
title: Noncanonical ‘return’ definition detected
summary: "'return', or '>>' not defined in terms of 'pure' or '*>'."
severity: warning
flag: -Wnoncanonical-monad-instances
introduced: 9.6.1
---

Since Applicative became a superclass of Monad, the 'return', and '>>' functions of law-abiding
Monad instances are assumed to be identical to the 'pure' and '*>' functions.

This warning is caused by a definition of 'return' that isn't equal to 'pure', or a definition of
'(>>)' that isn't equal to '(*>)'.
