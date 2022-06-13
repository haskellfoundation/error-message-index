---
title: Lambda requires at least one parameter
summary: A lambda expression must have at least one parameter.
severity: error
introduced: 9.6.1
---

The parameter list of a lambda expression `\param_1 ... param_n -> ...` cannot be empty.
A lambda expression of the form `\ -> ...` causes this error.
