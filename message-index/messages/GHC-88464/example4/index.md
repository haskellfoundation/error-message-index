---
title: Used a typed hole
---

## Error Message

```
Example4.hs:4:7: error: [GHC-88464]
    • Found hole: _ :: a -> Bool
      Where: ‘a’ is a rigid type variable bound by
               the type signature for:
                 foo :: forall a. Eq a => a -> Bool
               at Example4.hs:3:1-24
    • In an equation for ‘foo’: foo = _
    • Relevant bindings include
        foo :: a -> Bool (bound at Example4.hs:4:1)
      Constraints include Eq a (from Example4.hs:3:1-24)
      Valid hole fits include foo :: a -> Bool (bound at Example4.hs:4:1)
  |
4 | foo = _
  |       ^
```

## Description

Typed holes are very useful! They work in _expressions_ (i.e. not in patterns or types). They generate an error, ensuring that you don't forget to put some code there, but the error message is designed to give you information about what kind of code fits here.

Here is the [GHC user's guide on typed holes](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/typed_holes.html).

In the error message, the most important parts are:

- The type of the hole: `a -> Bool` in this case.
- Where the type variables come from that appear in this type; `a` here comes from `foo`'s type signature.
- Relevant constraints: in this case, we know that `Eq a` holds. This list is in general not exhaustive; sometimes there are many possibly (indirectly) relevant constraints, and GHC has to make some selection of what to show.
- Valid hole fits: these are suggestions from GHC of names that would typecheck in the hole. This is also in general not an exhaustive list, and typically you'll want to write code that is not quite as simple as a single variable. In this case, GHC sees that `foo` fits &mdash; which is not terribly helpful.

Typed holes can be used for what is sometimes called _type-driven programming_: ask GHC what type it wants in a particular place, decide that the code should then look roughly like so (with the parts you don't yet know filled in with holes `_` again), ask GHC for the types of those holes, etc. This is mostly useful when you have very precise types in your code, typically involving some type-level programming.

If you want to test your code while you still have typed holes in your code, pass the [`-fdefer-typed-holes`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/defer_type_errors.html#ghc-flag--fdefer-typed-holes) flag to GHC. More generally, there is also the much more aggressive [`-fdefer-type-errors`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/defer_type_errors.html#ghc-flag--fdefer-type-errors).
