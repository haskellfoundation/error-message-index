---
title: Strictness annotation on unlifted type
summary: Using a strictness annotation (bang) on an unlifted type is redudant as unlifted values are strict by definition
severity: warning
flag: -Wredundant-strictness-flags
introduced: 9.6.1
---

A strictness annotation (also called a bang: `!`) can be used to denote that a value should not be evaluated lazily.
In some cases this can lead to faster code because fewer heap allocations are required.
Here it is used to mark a that a field in a datatype should not be evaluated lazily.

However, values of unlifted types like `Int#` are strict by definition because they represent an actual value,
not a pointer to a potentially unevaluated value (thunk).

Therefore, adding strictness annotations to unlifted types or fields of such types is redundant.
They should be omitted to avoid confusion.
