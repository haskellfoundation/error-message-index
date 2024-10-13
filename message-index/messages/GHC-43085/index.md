---
title: Overlapping Instances
summary: Multiple type class instances are resolved for a single type class method call.
severity: error
introduced: 9.6.1
---

Type class methods that make use of
[overlapping instances](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/instances.html#overlapping-instances)
lead may lead to an error because the resolved candidates would lead to indeterministic program behavior.

We can solve this by annotating the instances with the `{-# OVERLAPS #-}`, `{-# OVERLAPPING #-}`, `{-# OVERLAPPABLE #-}` and `{-# INCOHERENT #-}` pragma.
The former three can only be used if instances are *strictly more specific* than one another, i.e. the type of an instance can be substituted for the type of another instance.

Note that `{-# INCOHERENT #-}` still leads to indeterministic behavior and thus should be used with caution.

~~~
before/Overlapping.hs:18:19: error: [GHC-43085]
    • Overlapping instances for Formatter (Maybe Int)
        arising from a use of ‘format’
      Matching instances:
        instance Formatter (Maybe Int)
          -- Defined at before/Overlapping.hs:13:10
        instance Formatter a => Formatter (Maybe a)
          -- Defined at before/Overlapping.hs:9:10
    • In the second argument of ‘($)’, namely
        ‘format (Nothing :: Maybe Int)’
      In the expression: putStrLn $ format (Nothing :: Maybe Int)
      In an equation for ‘main’:
          main = putStrLn $ format (Nothing :: Maybe Int)
   |
18 | main = putStrLn $ format (Nothing :: Maybe Int)
   |                   ^^^^^^
~~~
