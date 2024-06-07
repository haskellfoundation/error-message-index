---
title: A local name is used in a top-level splice as a function argument.
---

The error message given by GHC is slightly misleading: you cannot pass a
_variable_ bound in the same module to a top-level splice, but you can pass in
just the `Name`. The name must be bound above the splice in the module file.

Depending on the information you need from the variable, this can be an
alternative to moving the variable binding to a different module.

The syntax for the `Name` literal of a function `f` is `'f`, and the `Name` of a
type `T` is `''T`. To extract information from a `Name`, see `reify` in
`Language.Haskell.TH`.

# Error Message
```
Example.hs:9:17: error: [GHC-18157]
    GHC stage restriction:
      ‘foo’ is used in a top-level splice, quasi-quote, or annotation,
      and must be imported, not defined locally
  |
9 | doSomethingWith foo
  |                 ^^^
```
