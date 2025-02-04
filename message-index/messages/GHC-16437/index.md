---
title: Bad Constructor used with deriving clause
summary: The deriving mechanism expects constructors of a particular form. When the constructors do not comport to this form, this error is thrown.
severity: error
introduced: 9.6.1
---

    • Can't make a derived instance of ‘Functor (T a)’:
        Constructor ‘Mk’ is a GADT
    • In the data declaration for ‘T’
    Suggested fix: Use a standalone deriving declaration instead
