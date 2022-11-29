---
title: The package does not exist in the snapshot
---

The given package name is not provided by the snapshot. For example, `stack build` results in the error:
```
Error: [S-4804]
       Stack failed to construct a build plan.
       
       While constructing the build plan, Stack encountered the following exceptions:
       
       In the dependencies for blah-0.1.0.0:
           wrong-package must match >=0.2, but the Stack configuration has no specified version (no
                         package with that name found, perhaps there is a typo in a package's
                         build-depends or an omission from the stack.yaml packages list?)
       needed since blah is a build target.
```
