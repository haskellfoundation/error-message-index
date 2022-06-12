---
title: Identifier is not a record selector
summary: An identifier does not refer to a record selector but is used as such.
severity: error
introduced: 9.6.1
---

Within a record update expression `r { selector1 = ..., ..., selectorN = ... }`, the selectors `selector1` ... `selectorN` must be bound by a record constructor declaration.
