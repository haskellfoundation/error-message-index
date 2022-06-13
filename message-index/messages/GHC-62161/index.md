---
title: Incomplete patterns
summary: Pattern match(es) are non-exhaustive.
severity: warning
introduced: 9.6.1
flag: -Wincomplete-patterns
---

A function definition or `case` expression did not cover all cases. This may
result in a run-time crash of the program.
