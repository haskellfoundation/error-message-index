---
title: Type expected, but kind received.
order: 0
---

Forgetting the type parameter to `Maybe` is the culprit, but it is only caught in the
context of the the arrow in the declaration of `isNothing`, which can be confusing.
Recall that the arrow (`->`) in Haskell is a type constructor, it takes two types
of *kind* `Type`, and returns a fresh type, also of kind `Type`. That is, for `x -> y`
to make any sense, GHC needs `x` and `y` to be types of kind `Type`, which is not
the case in this example: `Maybe` by itself has kind `Type -> Type`.

If you ever need to know the kind of something, you can ask `ghci`
with the `:kind` (or its shorthand `:k`), keeping in mind
that `*` (pronounced "star") is a synonym for `Type`:

```
ghci> :k (->)
(->) :: * -> * -> *
ghci> :k Maybe
Maybe :: * -> *
```
