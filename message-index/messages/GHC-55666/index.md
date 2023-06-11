---
title: Strictness annotation on unlifted type
summary: Using a strictness annotation (bang) on an unlifted type is redudant as unlifted values are strict by definition
severity: warning
flag: -Wredundant-strictness-flags
introduced: GHC 9.6.1
---

A strictness annotation (also called a bang: `!`) can be used to denote that a type should not be evaluated lazily.
In some cases this can lead to faster code because fewer heap allocation are required.

However, unlifted types like `Int#` are strict by definition because they are a value,
not a pointer to a potentially unevaluated value (thunk).

Therefore, adding strictness annotations to unlifted types or fields of such types are redudant.
They should be omitted to prevent confusion.
