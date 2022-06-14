---
title: Kind and type arguments out of dependency order
summary: Kind arguments must occur prior to the types that they classify.
severity: error
introduced: 9.6.1
extension: PolyKinds
---

Normally, Haskell's lexical scoping rules suffice to ensure that arguments to functions, whether they are type arguments or value arguments, are in scope in every position where they are used.
In particular, because type and kind arguments form [telescopes](https://doi.org/10.1016/0890-5401(91)90066-B) in which each argument's name is in scope for the remaining arguments, lexical scope ensures that kind arguments occur before the types that they classify.
However, in some cases, unannotated types can have kinds that are forced through unification to be equal to kinds that occur later in the argument list.
This would lead to a scope error in the resulting fully-annotated program, so it is not allowed.
