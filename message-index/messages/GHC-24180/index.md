---
title: Too few arguments to infix type operator
summary: A type operator was not provided with both arguments.
severity: warning
extension: TypeOperators
introduced: 9.6.1
---

This error occurs when an infix operator in a type is used as a prefix or postfix operator. That is, if one writes `T1 OP` or `OP T2` instead of `T1 OP T2`, for types `T1` and `T2` and infix operator `OP`.
