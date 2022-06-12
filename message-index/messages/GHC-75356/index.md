---
title: Export item suggests constructors/methods
summary: An export item suggests that (in-scope) constructors or class methods exist when they do not.
severity: warning
flag: -Wdodgy-imports
introduced: 9.6.1
---

When exporting identifiers from a module, all in-scope constructors (for a type) or the in-scope methods (for a typeclass) can also be exported with the `T(..)` syntax. However, if `T` does not have in-scope constructors - the type is being re-exported and does not have its constructors imported) or it has no constructors - then this export item suggests that the programmer intended for `T` to have in-scope constructors/methods when it has none.