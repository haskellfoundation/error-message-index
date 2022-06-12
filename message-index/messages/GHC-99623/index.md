---
title: Import item suggests constructors/methods
summary: An import item suggests that (in-scope) constructors or class methods exist when they do not.
severity: warning
flag: -Wdodgy-imports
introduced: 9.6.1
---

When importing identifiers from a module, all in-scope constructors (for a type) or the in-scope methods (for a typeclass) can also be imported with the `T(..)` syntax. However, if `T` was *exported* abstractly as only `T` - either its constructors/methods are not exported, or it lacks any - then this import item suggests that T has in-scope constructors/methods when it has none.
