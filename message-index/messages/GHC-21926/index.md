---
title: Version number or non-alphanumeric character in package name
summary: Package imports may only consist of alphanumeric characters, and must omit the version.
severity: error
introduced: 9.6.1
extension: PackageImports
---

Version number or non-alphanumeric character in the package. Alphanumeric characters are letters and numbers, as defined by `Data.Char.isAlphaNum`.
Note that you will also see this error if the package name consists only of digits.
The package name in this case refers to the one mentioned in an import when using the `PackageImports` language extension.
