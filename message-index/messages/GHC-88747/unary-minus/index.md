---
title: Unary minus mixed with multiplication
---

```
Main.hs:1:8: error: [GHC-88747]
    Precedence parsing error
        cannot mix ‘*’ [infixl 7] and prefix `-' [infixl 6] in the same infix expression
  |
1 | main = print $ 5 * -3
  |        ^^^^^^^^^^^^^^
```

The most general solution is to add brackets: `5 * (-3)`.

If one of the clashing operators is unary minus, consider replacing it with `negate`: `5 * negate 3`. Another possibility is to enable [`{-# LANGUAGE LexicalNegation #-}`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/lexical_negation.html) or [`{-# LANGUAGE NegativeLiterals #-}`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/negative_literals.html), which makes `-` bind to `3` as early as possible, eliminating the ambiguity.
