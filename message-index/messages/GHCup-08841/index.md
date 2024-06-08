---
title: BuildFailure With Compile
summary: When using ghcup compile hls -g master --ghc 8.10.4; a build failure occurs.
introduced: ghcup, version 0.1.19.4
severity: error
---

```
$ ghcup compile hls -g master --ghc 8.10.4
[ Warn  ] New ghc version available. If you want to install this latest version, run 'ghcup install ghc 9.8.1'
[ Warn  ] New stack version available. If you want to install this latest version, run 'ghcup install stack 2.13.1'
[ Info  ] Fetching git repo https://github.com/haskell/haskell-language-server.git at ref master (this may take a while)
[ Info  ] Examining git ref master
[ ...   ]   HLS version (from cabal file): 2.4.0.0
[ ...   ]   commit hash: 0f9be3ea7c6b189cfbf8660bf2766eb9180a78ce
[ Info  ] Building HLS 2.4.0.0 for GHC version 8.10.4
[ cabal ] ghc-8.4.4, ghc-8.4.3, ghc-8.4.1, ghc-8.2.2, ghc-8.2.1, ghc-9.2.3.20220620
[ cabal ] (constraint from non-upgradeable package requires installed instance)
[ cabal ] [__1] fail (backjumping, conflict set: ghc, ghcide)
[ cabal ] After searching the rest of the dependency tree exhaustively, these were the
[ cabal ] goals I've had most trouble fulfilling: ghcide, ghc
[ cabal ] 
[ Error ] [GHCup-08841] BuildFailed failed in dir /home/.../.ghcup/tmp/ghcup-eb35d2cd0af3dbd1: Process "cabal" with arguments ["v2-install",
[ ...   ]                                                                                                                 "-w",
[ ...   ]                                                                                                                 "ghc-8.10.4",
[ ...   ]                                                                                                                 "--install-method=copy",
[ ...   ]                                                                                                                 "--overwrite-policy=always",
[ ...   ]                                                                                                                 "--disable-profiling",
[ ...   ]                                                                                                                 "--disable-tests",
[ ...   ]                                                                                                                 "--installdir=/home/tobzdaman619/.ghcup/tmp/ghcup-eb35d2cd0af3dbd1/out/8.10.4",
[ ...   ]                                                                                                                 "--project-file=cabal.project",
[ ...   ]                                                                                                                 "exe:haskell-language-server",
[ ...   ]                                                                                                                 "exe:haskell-language-server-wrapper"] failed with exit code 1.
```
This occurs with all versions of cabal and ghc so far.
