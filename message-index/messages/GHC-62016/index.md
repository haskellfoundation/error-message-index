---
title: Cannot derive well-kinded instance
summary: An instance cannot be derived because the kinds cannot be made to match.
introduced: 9.6.1
severity: error
---

This error means that the mentioned type class in the `deriving`
clause does not accept the data type you are defining as argument.

More concretely, when GHC finds a declaration of the form

```haskell
data T ... = C ... | D ...
  deriving Klass
```

there's a small procedure which tries to drop type arguments
from `T` until it matches the kind expected by `Klass`.
If this procedure fails, the error message appears.
