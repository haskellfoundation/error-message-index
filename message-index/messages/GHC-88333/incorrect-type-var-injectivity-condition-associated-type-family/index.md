---
title: Incorrect type variable on the LHS of injectivity condition
---

In the example, the associated type family Ft is defined with an incorrect injectivity annotation. The left-hand side (LHS) of the injectivity condition should be the output type variable (r), but in the definition, it is the input type variable (a). This is what the error message is referring to.
