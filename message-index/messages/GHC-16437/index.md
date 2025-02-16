---
title: Bad Constructor used with deriving clause
summary: Standard deriving fails on GADTs and higher-rank types 
severity: error
introduced: 9.6.1
---

The deriving mechanism expects constructors of a particular form. When the constructors do not comport to this form, this error is thrown:

    • Can't make a derived instance of ‘Functor (T a)’:
        Constructor ‘Mk’ is a GADT
    • In the data declaration for ‘T’
    Suggested fix: Use a standalone deriving declaration instead
