---
title: Ambiguous module name from multiple packages
summary: A module with the same name was exported from multiple packages
severity: error
introduced: 9.6.1
---


When two packages export a module of the same name, ghc doesn't know which you
want to import.

The solution is to use package import.

So if we've two packages:

+ package fruits exports tomatoes:
```haskell
module Tomatoes where
```

+ and package vegetables exports tomatoes:

```haskell
module Tomatoes where
```

then our package salad program will cause an error:

```
module Salad where
import Tomatoes
```

The solution is to be specific with package imports: 

```
{-# LANGUAGE PackageImports #-}
module Salad where
import "fruits" Tomatoes
```
