---
title: Noncanonical `mappend` definition
summary: A Monoid instance uses a custom `mappend` implementation rather than re-using the default `(<>)` operation from its Semigroup instance.
severity: warning
flag: -Wnoncanonical-monoid-instances
introduced: 9.8.1
---

As part of the Semigroup Monoid proposal, the Semigroup class is now a
superclass of Monoid. Now, the `mappend` function is redundant and should
always do exactly the same as the `(<>)` function of the Semigroup instance.
In the future, the `mappend` function may even be removed completely.

So, you should adapt to these changes by either:

* Changing the definition of `mappend` to use `(<>)`. This is backwards compatible, but may break in the future.
* Removing the definition of `mappend` and rely on the default instance which uses `(<>)`. This is forwards compatible, but breaks your code for GHC 8.2 or earlier.

