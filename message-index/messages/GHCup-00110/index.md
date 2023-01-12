---
title: The tool is already installed with that version
summary: GHCup has already installed the requested version of the tool
severity: warning
introduced: 0.1.19.0
---

GHCup was asked to install a given version of a tool, but that version is already installed. GHCup will not overwrite existing installations. A tool can be removed using `ghcup rm`.

As an example, on a machine that does not already have GHC version 9.4.4 installed, the `install` subcommand will install the tool:
```
$ ghcup install ghc 9.4.4
Up to date
[ Info  ] downloading: https://downloads.haskell.org/~ghc/9.4.4/ghc-9.4.4-x86_64-fedora33-linux.tar.xz as file /home/davidc/.ghcup/tmp/ghcup-c11c847788991b9c/ghc-9.4.4-x86_64-fedora33-linux.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  174M  100  174M    0     0  5935k      0  0:00:30  0:00:30 --:--:-- 6684k
[ Info  ] verifying digest of: ghc-9.4.4-x86_64-fedora33-linux.tar.xz
[ Info  ] Unpacking: ghc-9.4.4-x86_64-fedora33-linux.tar.xz to /home/davidc/.ghcup/tmp/ghcup-b1bbf15003546e80
[ Info  ] Installing GHC (this may take a while)
[ Info  ] Merging file tree from "/home/davidc/.ghcup/tmp/ghcup-6be1bd3d167c9494/home/davidc/.ghcup/ghc/9.4.4" to "/home/davidc/.ghcup/ghc/9.4.4"
```
Running the command a second time results in the warning, and installation is not re-run:
```
$ ghcup install ghc 9.4.4
Up to date
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml as file /home/davidc/.ghcup/cache/ghcup-0.0.7.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
[ Warn  ] [GHCup-00110] ghc-9.4.4 is already installed; if you really want to reinstall it, you may want to run 'ghcup install ghc --force 9.4.4'
```
