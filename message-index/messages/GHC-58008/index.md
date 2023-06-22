---
title: Pattern matching on GADTs without MonoLocalBinds is fragile
summary: Pattern matching on GADTs without MonoLocalBinds is fragile
introduced: 9.6.1
severity: warning
flag: -Wgadt-mono-local-binds
---

This warning is triggered on pattern matching involving GADTs, if `MonoLocalBinds` is disabled. Type inference can be fragile in this case.
See [the OutsideIn(X) paper](https://doi.org/10.1017/S0956796811000098) and [Let-generalisation](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/let_generalisation.html) for more details.
To resolve this warning, you can enable `MonoLocalBinds` or an extension implying it (`GADTs` or `TypeFamilies`).
The warning is also triggered when matching on GADT-like pattern synonyms (i.e. pattern synonyms containing equalities in provided constraints).
In previous versions of GHC (9.2 and below), it was an error to pattern match on a GADT if neither `GADTs` nor `TypeFamilies` were enabled.
