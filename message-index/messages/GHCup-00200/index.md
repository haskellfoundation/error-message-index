---
title: File digest verification failed
summary: GHCup tried to verify the integrity/authenticity of a downloaded file, but the verification failed
severity: error
introduced: 0.1.19.0
---

GHCup was asked to install a given version of a tool, but the file could not be verified. E.g.:

```
$ ghcup install ghc 9.0.2
[ Info  ] verifying digest of: ghc-9.0.2-x86_64-fedora27-linux.tar.xz
[ Error ] [GHCup-00200] Digest error for /home/hasufell/.ghcup/cache/ghc-9.0.2-x86_64-fedora27-linux.tar.xz: expected b2670e9f278e10355b0475c2cc3b8842490f1bca3c70c306f104aa60caff37b0 but got e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
[ ...   ] Consider removing the file in case it's cached and try again.
[ Error ] Also check the logs in /home/hasufell/.ghcup/logs``
```

There can be a number of reasons for this. If you have GHCup caching enabled, try to delete the file, e.g. in the above case:

```
rm /home/hasufell/.ghcup/cache/ghc-9.0.2-x86_64-fedora27-linux.tar.xz
```

Then try to install again.

If the problem persists or you don't have caching enabled, it's possible that you are having network issues.
You can try to switch the downloader and see if that helps, e.g.:

```
ghcup --downloader=wget install ghc 9.0.2
```

Otherwise the file may simply be corrupted or the [GHCup metadata](https://github.com/haskell/ghcup-metadata) incorrect.
In that case, raise an issue [here](https://github.com/haskell/ghcup-metadata/issues).
