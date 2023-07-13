---
title: User-specified instance is not allowed
summary: Type class does not allow user-specified instances
severity: error
introduced: 9.6.1
---

There are several special type classes in [base](https://hackage.haskell.org/package/base) which require special treatment from the compiler. For this reason they don't permit user-specified instances.

An attempt to provide an explicit instance declaration in your library / application code, e.g.
```haskell
instance Coercible A B where ...
```
will lead to this error being reported.

The instances for these type classes are automatically created by GHC on an as-needed basis.

This restriction applies to the following type classes:

- [Coercible](https://hackage.haskell.org/package/base/docs/Data-Coerce.html#t:Coercible) - This class does not have regular instances; instead they are created on-the-fly during type-checking.
- [Typeable](https://hackage.haskell.org/package/base/docs/Type-Reflection.html#t:Typeable) - Since GHC 7.10, all types automatically have `Typeable` instances derived. This is in contrast to previous releases where Typeable had to be explicitly derived using the DeriveDataTypeable language extension.
- Type equality classes `~` and `~~` defined in [Data.Type.Equality](https://hackage.haskell.org/package/base/docs/Data-Type-Equality.html)
- [WithDict](https://hackage.haskell.org/package/base/docs/GHC-Exts.html#t:WithDict) - is used to create dictionaries for classes with a single method. It is used to implement a primitive that we cannot define in Haskell but we can write in Core. Some details can be found in a [Note in GHC library](https://hackage.haskell.org/package/ghc-9.6.1/docs/src/GHC.Tc.Instance.Class.html#line-493)
- [KnownChar](https://hackage.haskell.org/package/base/docs/GHC-TypeLits.html#t:KnownChar) - This class gives the Char associated with a type-level Char literal. There are instances of the class for every concrete literal: 'a', 'b', 'c' etc. But instances for user-defined types are not permitted.
- [KnownNat](https://hackage.haskell.org/package/base/docs/GHC-TypeNats.html#t:KnownNat) - This class gives the integer associated with a type-level natural. There are instances of the class for every concrete literal: 0, 1, 2, etc. But instances for user-defined types are not permitted.
- [KnownSymbol](https://hackage.haskell.org/package/base/docs/GHC-TypeLits.html#t:KnownSymbol) - This class gives the string associated with a type-level symbol. There are instances of the class for every concrete literal: "hello", etc. But instances for user-defined types are not permitted.
- [Generic](https://hackage.haskell.org/package/base/docs/GHC-Generics.html#t:Generic) - This class is one of the key pieces of `GHC.Generics` and you usually want to derive it using [DeriveGeneric](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/generics.html#extension-DeriveGeneric) extension. Hand-written instances of Generic instances are allowed by default, but disallowed when [SafeHaskell](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/safe_haskell.html) extension is enabled.

