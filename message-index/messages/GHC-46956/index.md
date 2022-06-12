---
title: Kind variable would escape its scope
summary: A local kind variable was used to classify a type from a scope in which the kind variable is not available.
introduced: 9.6.1
severity: error
---

This error occurs during kind inference. When inferring a kind for a type variable, GHC creates a fresh metavariable to stand for the kind. Later, if something forces this kind metavariable to be equal to some other kind, unification equates them. However, local kind quantification can lead to the existence of kinds that are only valid in the scope of the quantifier. If a kind metavariable that originated outside this scope were unified with the locally-bound kind, then the resulting program would contain an ill-scoped kind signature.
