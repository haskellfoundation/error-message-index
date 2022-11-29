---
title: Stack failed to construct a build plan
summary: The package could not be found in the snapshot
severity: error
introduced: 2.9.3
---

This error occurs when Stack configuration has no package with the given name or if the version number of a package does not match the one from Stack configuration. The error covers the following situations:

 * The specific package does not exist
 * The specific version of a given package does not exist

See the list of packages provided by the snapshots [Stackage](https://www.stackage.org/).
