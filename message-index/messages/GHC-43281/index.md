---
title: Self Import
summary: This error occurs when a module tries to import itself.
severity: error
introduced: 9.6.1
---

This error happens when an import statement (e.g. `import A`) references its parent module (in our example `A`).
This creates a cyclic dependency of the smallest magnitude, i.e., a self referencing import.