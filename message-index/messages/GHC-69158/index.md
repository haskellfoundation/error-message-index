---
title: Conflicting exports
summary: Different identifiers with the same name are (re-)exported from the same module.
introduced: 9.6.1
severity: error
---

This error means that a module is trying to export two identifiers with the same
name, but which are actually different because they were imported from separate
modules. This can happen when at least one of the identifiers is re-exported
using a qualified name, or all imported identifiers from a module are
re-exported using the `module` keyword.
