---
title: GPG verify failed
summary: GHCup tried to verify the authenticity of a software channel using GPG, but failed
severity: error
introduced: 0.1.19.0
---

GHCup receives information about available Haskell tools through a metadata file in YAML format that describes where to find the tools. As a defense against unauthorized third parties misleading GHCup into installing malicious software, GHCup supports checking that these metadata files are signed by a trusted [GPG](https://en.wikipedia.org/wiki/GNU_Privacy_Guard) key. This error occurs when GHCup was asked to verify all downloaded YAML files via GPG. E.g.

```
$ ghcup --gpg strict list
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml as file /home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  286k  100  286k    0     0  2848k      0 --:--:-- --:--:-- --:--:-- 2862k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   682  100   682    0     0  11278      0 --:--:-- --:--:-- --:--:-- 11366
[ Info  ] verifying signature of: /home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml
[ Error ] [GHCup-00210] GPG verify failed: GPG verify failed: Process "gpg" with arguments ["--batch",
[ ...   ]                                                                     "--verify", "--quiet",
[ ...   ]                                                                     "--no-tty",
[ ...   ]                                                                     "/home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml.sig",
[ ...   ]                                                                     "/home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml"] failed with exit code 2.
```

## Troubleshooting
First, make sure the remote file exists. It's name is the same as the YAML file, except it ends with `.sig`. For example:

* https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml
* https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml.sig

Then make sure you have the required GPG public keys: https://www.haskell.org/ghcup/guide/#gpg-verification

Run ghcup with `-v` to see the exact gpg error, e.g.:

```
$ ghcup -v --gpg strict list
[...]
[ Info  ] verifying signature of: /home/hasufell/.ghcup/cache/ghcup-prereleases-0.0.7.yaml
[ Debug ] gpg: Signature made Sat 26 Aug 2023 01:20:02 PM +08
[ ...   ] gpg:                using RSA key 7D1E8AFD1D4A16D71FADA2F2CCC85C0E40C06A8C
[ ...   ] gpg:                issuer "hasufell@posteo.de"
[ ...   ] gpg: Can't check signature: No public key
[ ...   ]
[ Error ] [GHCup-00210] GPG verify failed: GPG verify failed: Process "gpg" with arguments ["--batch",
[ ...   ]                                                                     "--verify", "--quiet",
[ ...   ]                                                                     "--no-tty",
[ ...   ]                                                                     "/home/hasufell/.ghcup/cache/ghcup-prereleases-0.0.7.yaml.sig",
[ ...   ]                                                                     "/home/hasufell/.ghcup/cache/ghcup-prereleases-0.0.7.yaml"] failed with exit code 2.
```
