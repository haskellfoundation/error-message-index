---
title: Boot module has a datatype which isn't in its corresponding ordinary module
---

In this example, we define a datatype `BootModuleOnlyDataType` in
`BootModuleDataTypeNotInOrdinaryModule.hs-boot`.

Compile the example files like so:

```sh
ghc -c BootModuleDataTypeNotInOrdinaryModule.hs-boot
ghc -c ImportBootModule.hs
ghc -c BootModuleDataTypeNotInOrdinaryModule.hs
```

In the before case, where we defined the datatype `BootModuleOnlyDataType` only
in `BootModuleDataTypeNotInOrdinaryModule.hs-boot`, we compile the modules like
so and receive the following error:

```
<no location info>: error:
    ‘BootModuleDataTypeNotInOrdinaryModule.BootModuleOnlyDataType’ is exported by the hs-boot file, but not exported by the module
```

In the after case, we add the datatype to
`BootModuleDataTypeNotInOrdinaryModule.hs`, and the error disappears.
