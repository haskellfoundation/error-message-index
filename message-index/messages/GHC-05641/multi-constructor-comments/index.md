---
title: The Nothing constructor is documented with two separate Haddock comments
---

In this example, the `Nothing` constructor was documented twice, once using a `-- |` style comment and once using a `-- ^` style comment. But only one form of comment is allowed per documented entity. In order to fix this warning, only use one form of documentation comment.

```
messages/GHC-05641/multi-constructor-comments/before/Multi-constructor-comments.hs:6:7: warning: [GHC-05641] [-Winvalid-haddock]
    Multiple Haddock comments for a single entity are not allowed.
    The extraneous comment will be ignored.
  |
6 |       -- ^ You can use the Nothing constructor where you would use `null`in other languages.
  |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
