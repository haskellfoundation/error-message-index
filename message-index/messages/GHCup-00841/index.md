---
title: A process exited prematurely
summary: GHCup executed a subprocess that did not complete successfully
severity: error
introduced: 0.1.19.0
---

This error can happen for a variety of reasons and may indicate that GHCup needs to improve error handling/messages.
Consider [raising an issue](https://github.com/haskell/ghcup-hs/issues).

One common source of errors is a missing or non-working C toolchain, leading to errors when trying to install GHC:

```
$ ghcup install ghc ghc-8.4.4
[ Info  ] downloading: https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-x86_64-fedora27-linux.tar.xz as file /home/hasufell/.ghcup/cache/ghc-8.4.4-x86_64-fedora27-linux.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  145M  100  145M    0     0  42.0M      0  0:00:03  0:00:03 --:--:-- 42.0M
[ Info  ] verifying digest of: ghc-8.4.4-x86_64-fedora27-linux.tar.xz
[ Info  ] Unpacking: ghc-8.4.4-x86_64-fedora27-linux.tar.xz to /home/hasufell/.ghcup/tmp/ghcup-3ee9976c7bb53f16
[ Info  ] Installing GHC (this may take a while)
[ ghc-configure ] checking whether ln -s works... yes
[ ghc-configure ] checking for gsed... sed
[ ghc-configure ] checking whether the C compiler works... no
[ ghc-configure ] configure: error: in `/home/hasufell/.ghcup/tmp/ghcup-3ee9976c7bb53f16/ghc-8.4.4':
[ ghc-configure ] configure: error: C compiler cannot create executables
[ ghc-configure ] See `config.log' for more details
[ Error ] [GHCup-00841] Process "sh" with arguments ["./configure",
[ ...   ]                              "--prefix=/home/hasufell/.ghcup/ghc/8.4.4"] failed with exit code 77.
[ Error ] Also check the logs in /home/hasufell/.ghcup/logs
```

For further troubleshooting information and setup and installation instructions, see the list of [system requirements per platform](https://www.haskell.org/ghcup/install/#system-requirements).

