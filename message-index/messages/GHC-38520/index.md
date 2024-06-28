---
title: Redundant Bang Patterns
summary: Used a Bang Pattern that has no Effect
severity: warning
flag: -Wredundant-bang-patterns
introduced: 9.6.1
---

The `BangPatterns` extension allows the user to mark (parts of) a pattern match as strict,
compared to Haskell's default of only evaluating a pattern match as little as it needs to
to determine whether to reject it or not.
This is done by prefixing the pattern with an exclamation mark, `!`.
Using bang patterns causes such values to always be strictly evaluated to Weak head normal
form (WHNF), before the rest of the matches, any guard patterns or the right-hand side
of a function clause are executed.

However, there are cases where a bang pattern can be redundant.
Either this is because a previous match clause was already stricter, because the user is
trying to match on a strict field of a data type, or because the type of the value being
matched on is of an unlifted or unboxed type like `Int#` or `Array#`.

In all of these cases, the Bang Pattern has no added effect, so it is redundant.
