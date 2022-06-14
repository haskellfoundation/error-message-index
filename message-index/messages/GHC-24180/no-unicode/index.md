---
title: Use of ∀ without UnicodeSyntax being enabled
---

## Message
```
Ident.hs:3:10: error: [GHC-24180]
    Operator applied to too few arguments: ∀
  |
3 | ident :: ∀ α.α → α
  |          ^
```

## Explanation

The `UnicodeSyntax` language extension causes GHC's parser to recognize a variety of non-ASCII mathematical symbols as representing their Haskell equivalents. The complete list is available in [the documentation](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/exts/unicode_syntax.html).

When this extension is not enabled, `∀` is instead recognized as an infix operator character that has no argument on its left side.
