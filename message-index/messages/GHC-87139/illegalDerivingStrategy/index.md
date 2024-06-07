---
title: Illegal deriving strategy on newtype
---

In this example, there is a deriving clause instructing GHC
to derive a `Show` instance for the newtype `Year`.

There are (at least) two different ways to derive such a `Show`
instance. The `stock` strategy is the standard generic way of
deriving `Show` instances for datatypes. The `newtype` strategy
is available for `newtype`s and simply uses the existing instance
of the underlying type, in this case `Int`.

The difference in the current example is that the `stock`-derived
`show` includes the constructor name, the `newtype`-derived does
not.

If multiple strategies are available, GHC chooses a default. In
the case of `deriving` for classes for which `stock`-deriving is
available, such as `Show`, `stock` is the default. If you want to
be explicit about this or explicitly deviate from the default,
you can specify a strategy explicitly.

This, however, requires the `DerivingStrategies` language extension
to be enabled, and if it is not, you will get an error. The fix in
this case is to enable the language extension, for example via a
compiler pragma.
