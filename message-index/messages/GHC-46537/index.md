---
title: Unsupported extension
summary: GHC failed to recognize name of a language extension
severity: error
introduced: 9.6.1
---

This error is reported when GHC fails to recognize the name of a language extension, provided via `{-# LANGUAGE ... #-}` pragma at the top of a `.hs` file.

There are two likely causes:

1. You've made a typo, in which case GHC will likely also suggest the correct extension name to use.
2. You're using older version of GHC that doesn't yet support the extension.
    Here's a couple of things you can try in order to troubleshoot:

    - Find out which version of GHC you're using:

          ghc --version

    - List all the supported extensions that this version of GHC supports. Does the list contain your desired extension?

          ghc --supported-extensions

    - Search for the extension name in the latest version of the [GHC User's Guide](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts.html). Most extensions have a `since` annotation which tells you in which version of GHC the extension was introduced.
