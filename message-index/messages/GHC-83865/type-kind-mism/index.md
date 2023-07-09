---
title: Type expected, but kind received.
order: 1
---

Forgetting the type parameter to `Maybe` is the culprit, but it is only caught in the
context of the the arrow in the declaration of `isNothing`, which can be confusing.
The arrow (`->`) in Haskell is a _type constructor_. It takes two types
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

## Error Message

```
Type.hs:1:14: error: [GHC-83865]
    • Expecting one more argument to ‘Maybe’
      Expected a type, but ‘Maybe’ has kind ‘* -> *’
    • In the type signature: isNothing :: Maybe -> Bool
  |
1 | isNothing :: Maybe -> Bool
  |
```
