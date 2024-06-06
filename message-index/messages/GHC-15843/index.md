---
title: Type constructor has conflicting definitions in the module and its hs-boot/hsig file
summary: The type constructor in the module and the signature in the boot module differ
severity: error
introduced: 9.6.1
---

The type constructor definitions in modules must agree with the cycle-breaking
`hs-boot` modules as well as with the Backpack `hsig` module interface files, if
any of the two exist.

Type constructor definitions in [`hs-boot` modules](https://downloads.haskell.org/ghc/9.12.1/docs/users_guide/separate_compilation.html#mutually-recursive-modules-and-hs-boot-files)
and [`hsig` files](https://downloads.haskell.org/ghc/9.12.1/docs/users_guide/separate_compilation.html#module-signatures) are typically
given by forward data declarations (data declarations without any data
constructors, only the type constructor is declared), as that is the whole
purpose of those two "interface-like modules".

Therefore, this error message likely comes up in one of two situations:

1. The kinds of type constructors differ in the interface module and in the
   actual module.
2. The type constructor kinds match, but the *roles* of some of the type
   arguments don't match.

The first situation can be typically be easily fixed by making sure the type
declaration in the boot/sig module has the same number of type arguments as the
declaration in the module and making sure any kind declarations are equal. The
second situation can normally be solved by given a type role declaration to the
type constructor. See the two examples below.

