---
title: Redundant Bang Patterns
summary: Used a bang pattern that has no effect
severity: warning
flag: -Wredundant-bang-patterns
introduced: 9.6.1
---

The `BangPatterns` extension allows the user to mark parts of a pattern as strict by prefixing the pattern with an exclamation mark.
By default, Haskell only evaluates an expression as little as it needs to determine whether the pattern matches or not.
Using bang patterns causes the matched expression to always be evaluated to weak head normal
form (WHNF) before the rest of the clauses, any guard patterns, or the right-hand side
of the clause are executed.

However, there are cases where a bang pattern can be redundant.
This happens either because a previous match clause already forced the evaluation, because the user is
trying to match on a strict field of a data type, or because the type of the value being
matched on is of an unlifted or unboxed type like `Int#` or `Array#`.

In all of these cases, the Bang Pattern has no added effect, so it is redundant.
