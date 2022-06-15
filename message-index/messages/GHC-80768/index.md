---
title: Class kind signatures need to be constraints
summary: It is an error to use type families in the return kind of a class
severity: error
introduced: 9.6.1
---

Similarly to how type families are not allowed in data type return kinds, type families are not allowed in class return kinds. Usually, GHC compares types and kinds up to type family reductions, but not in these two cases.
