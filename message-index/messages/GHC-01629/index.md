---
title: Too many type arguments in constructor pattern
summary: Too many type applications to a constructor in a pattern.
severity: error
introduced: 9.6.1
---

Every type application has to be "consumed" by a type variable in the
corresponding type.  Just as it is an error to pass more than one argument to `putStrLn`,  it is also an error to apply more types than there are
type variables in a type. For instance, if a type has only 1 type parameter (e.g. `Maybe a`), we can only apply 1 type argument (e.g. applying `@Int` to produce `Maybe Int`); there is no unbound type parameter present for further applications.
