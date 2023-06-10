---
title: Cannot use qualified in pre and postpositive position
summary: A module cannot be imported using the qualified modifier in pre and postpositive position
severity: error
introduced: 9.6.1
---

With the language extension `ImportQualifiedPost` it is possible to import a module using the `qualified` modifier after the name of the module. But it is not legal to use the `qualified` modifier both before and after the name of the module.
