---
title: Version number or non-alphanumeric character in package name
summary: Package imports may only consist of alphanumeric characters, and must omit the version
severity: error
introduced: 9.6.1
---

Version number or non-alphanumeric character in package name. Alphanumeric characters are letters and numbers, as defined by `Data.Char.isAlphaNum`.
The package name in this case refers to the package specified with imports after enabling the `PackageImports` language extension.
