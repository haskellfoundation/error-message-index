---
title: User-defined type error
summary: An invalid constraint or type family reduces to a custom type error.
introduced: 9.6.1
severity: error
---

Errors like this usually come from libraries trying to enforce certain
rules about the types they work with, or to improve upon a compiler error that
would occur otherwise. It is up to the library authors to provide enough
information in the embedded error message to fix the failing program—check
the documentation for the function that triggered the error for more
information.
These errors are constructed using `GHC.TypeLits.TypeError` applied to a type
level error message as the context of a class instance, and the compiler
will show them when a program attempts to use such an instance.
