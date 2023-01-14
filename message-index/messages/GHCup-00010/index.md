---
title: Unable to find a download for the requested version/distro
summary: GHCup wasn't able to find a binary distribution for the requested tool for the current platform
severity: error
introduced: 0.1.19.0
---

GHCup was asked to install a given version of a tool, but couldn't find download information in [GHCup's list of available tools](https://github.com/haskell/ghcup-metadata) and cannot proceed.

As an example, on Alpine linux `x86_64`, we can't install GHC 8.8.3:
```
$ ghcup install ghc 8.8.3
[ Error ] [GHCup-00010] Unable to find a download for the requested version/distro.
[ Error ] Also check the logs in /home/hasufell/.ghcup/logs
```

Both `ghcup list` and `ghcup tui` make it visible if there are binary distributions missing, e.g.:

```
$ ghcup list -t ghc
   Tool Version Tags                      Notes
✗  ghc  7.10.3  base-4.8.2.0              no-bindist
✗  ghc  8.0.2   base-4.9.1.0
✗  ghc  8.2.2   base-4.10.1.0
✗  ghc  8.4.1   base-4.11.0.0             no-bindist
✗  ghc  8.4.2   base-4.11.1.0             no-bindist
✗  ghc  8.4.3   base-4.11.1.0             no-bindist
✗  ghc  8.4.4   base-4.11.1.0
✗  ghc  8.6.1   base-4.12.0.0             no-bindist
✗  ghc  8.6.2   base-4.12.0.0             no-bindist
✗  ghc  8.6.3   base-4.12.0.0             no-bindist
✗  ghc  8.6.4   base-4.12.0.0             no-bindist
✗  ghc  8.6.5   base-4.12.0.0
✗  ghc  8.8.1   base-4.13.0.0             no-bindist
✗  ghc  8.8.2   base-4.13.0.0             no-bindist
✗  ghc  8.8.3   base-4.13.0.0             no-bindist
✗  ghc  8.8.4   base-4.13.0.0
✗  ghc  8.10.1  base-4.14.0.0
✗  ghc  8.10.2  base-4.14.1.0
✗  ghc  8.10.3  base-4.14.1.0
✗  ghc  8.10.4  base-4.14.1.0
✗  ghc  8.10.5  base-4.14.2.0
✗  ghc  8.10.6  base-4.14.3.0
✗  ghc  8.10.7  base-4.14.3.0
✗  ghc  9.0.1   base-4.15.0.0
✗  ghc  9.0.2   base-4.15.1.0
✗  ghc  9.2.1   base-4.16.0.0
✗  ghc  9.2.2   base-4.16.1.0
✗  ghc  9.2.3   base-4.16.2.0
✗  ghc  9.2.4   base-4.16.3.0
✗  ghc  9.2.5   recommended,base-4.16.4.0
✗  ghc  9.4.1   base-4.17.0.0
✗  ghc  9.4.2   base-4.17.0.0
✗  ghc  9.4.3   base-4.17.0.0
✗  ghc  9.4.4   latest,base-4.17.0.0
```

This indicates that support for this platform is lacking. Currently the most affected are Alpine Linux `x86_64`, FreeBSD `x86_64`, Linux `armv7`, Linux `aarch64`, Darwin `aarch64` (only has versions for 8.10.7 onwards). More information can be seen here: [GHCup supported platforms](https://www.haskell.org/ghcup/install/#supported-platforms).
If you want to contribute binary distributions for existing GHC versions, [raise an issue here](https://github.com/haskell/ghcup-metadata/issues). If you want GHC to improve platform support going forward, [raise an issue here](https://gitlab.haskell.org/ghc/ghc/-/issues/).

You can also check the current GHCup metadata (as time of writing it's version `0.0.7`) here: [https://github.com/haskell/ghcup-metadata/blob/develop/ghcup-0.0.7.yaml](https://github.com/haskell/ghcup-metadata/blob/develop/ghcup-0.0.7.yaml), which defines the bindists per tool and platform and [raise an issue there](https://github.com/haskell/ghcup-metadata/issues).

Other reasons you might get this error:

* The version of the tool you specified doesn't exist at all, e.g. `ghcup install ghc blah`.
* The version of the tool you specified wasn't added to GHCup yet, but will likely be added soon. Please [raise an issue here](https://github.com/haskell/ghcup-metadata/issues) and make sure to update ghcup's internal list of available tools with `ghcup upgrade`.
* The version of the tool you specified was a pre-release, like an alpha or release candidate. Add [a release channel](https://www.haskell.org/ghcup/guide/#pre-release-channels) to make it available. For example: `ghcup config add-release-channel https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-prereleases-0.0.7.yaml`.
