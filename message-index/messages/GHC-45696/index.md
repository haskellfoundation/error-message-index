---
title: If-Then-Else in pattern match
summary: If-Then-Else expression in pattern match.
severity: error
introduced: 9.6.1
---

When pattern matching, `(if .. then .. else)` expressions are not allowed as patterns to be matched against.

If your intention is to have conditional pattern matching, consider either pattern matching on tuples or to move the if statement outside of the pattern.
