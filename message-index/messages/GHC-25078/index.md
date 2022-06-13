---
title: Precedence out of range
summary: An invalid operator precedence was provided.
severity: error
introduced: 9.6.1
---

When defining custom infix operators and assigning them an operator precedence with `infixl` or `infixr`, the precedence must be `1 <= x <= 9`.
