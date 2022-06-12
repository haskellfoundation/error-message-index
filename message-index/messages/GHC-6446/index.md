---
title: Do notation in pattern match
summary: Do notation in pattern match
severity: error
introduced: 9.6.1
---

When pattern matching, `do` blocks are not allowed as expressions to be pattern matched against.

Instead, either match on a variable within the `do` block, or on the value the `do` block itself evaluates to.
