---
title: A download failed
summary: GHCup tried to download an artifact, but the download failed with a subprocess exiting prematurely
severity: error
introduced: 0.1.19.0
---

GHCup was asked to install a given version of a tool, but the download via `curl` or `wget` failed.

As an example, trying to install a GHC version via a non-existent url will throw:
```
$ ghcup install ghc -u https://nothing/ghc.tar.gz 9.4.3
[ Info  ] downloading: https://nothing/ghc.tar.gz as file /home/hasufell/.ghcup/cache/ghc.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: nothing
[ Error ] [GHCup-05841] Download failed: Process "curl" with arguments ["-fL", "-o",
[ ...   ]                                                 "/home/hasufell/.ghcup/cache/ghc.tar.gz.tmp",
[ ...   ]                                                 "https://nothing/ghc.tar.gz"] failed with exit code 6.
[ Error ] Also check the logs in /home/hasufell/.ghcup/logs
```

This error is a combination of [GHCup-00841](https://errors.haskell.org/messages/GHCup-00841/index.html) and `GHCup-05000`.

Reasons for this errors:

* the URL does not point to a valid download (this could be a [ghcup-metadata](https://github.com/haskell/ghcup-metadata) issue)
* you have networking issues
* your `curl` or `wget` installations are broken

The best way to debug this is trying to download the URL manually:

* try with curl
* then try with wget
* also try in your browser

If you're using a proxy, make sure your shell is configured to [use the correct configuration](https://docs.cloudfoundry.org/cf-cli/http-proxy.html#:~:text=The%20https_proxy%20environment%20variable%20holds,depends%20on%20your%20operating%20system.)
via the `https_proxy`/`http_proxy` environment variables.

If you believe GHCup is providing faulty URLs, [open an issue here](https://github.com/haskell/ghcup-metadata/issues).

