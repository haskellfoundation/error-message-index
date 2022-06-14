---
title: Illegal datatype context
summary: Constraints present in datatype declaration without DatatypeContexts.
severity: error
introduced: 9.6.1
---

Without the language extension `DatatypeContexts` enabled, it is illegal to add constraints to the context of a datatype definition. Whilst this can be solved with enabling `DatatypeContexts`, *however* this extension is deprecated and is considered a misfeature. Other solutions to fix this can include:

- Placing constraints on the *use-site* of a datatype, or
- Using GADTs to place constraints on specific datatype constructors.
