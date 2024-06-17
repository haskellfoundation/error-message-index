---
title: The roles do not match
---

The [roles](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/roles.html)
of the type constructor arguments do not match. A typical reason for the roles
not to match is that, in `.hs-boot` and `.hsig` modules, the role of arguments
in the forward type declarations defaults to `representional`.

In the following example, the role of the type argument in the actual module is
`phantom`,  because it doesn't occur in the RHS of the data declaration. Since
`representational` is inferred for the `hs-boot` declaration.

## Example error text

```
T9204.hs:7:1: error: [GHC-15843]
    • Type constructor ‘D’ has conflicting definitions in the module
      and its hs-boot file.
      Main module: type role D phantom
                   type D :: * -> *
                   data D a
        Boot file: type D :: * -> *
                   data D a
      The roles do not match.
      NB: roles on abstract types default to ‘representational’ in hs-boot files.
    • In the data type declaration for ‘D’
```
