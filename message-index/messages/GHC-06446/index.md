---
title: Do notation in pattern match
summary: Do notation in pattern match.
severity: error
introduced: 9.6.1
---

When pattern matching, `do` expressions are not allowed as patterns to be matched against.

Instead, either match on a variable within the `do` block, or on the value the `do` block itself evaluates to.
