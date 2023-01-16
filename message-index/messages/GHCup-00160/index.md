---
title: JSON decoding failed
summary: GHCup tried to decode it's metadata file, but an error occured
severity: error
introduced: 0.1.19.0
---

This error can happen on any subcommand (`list`, `tui`, `install`, etc.). GHCup downloads
a metadata file on start that contains information about available tool versions and binary distributions.

```
$ ghcup list
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml as file /home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: raw.githubusercontent.com
[ Warn  ] Could not get download info, trying cached version (this may not be recent!)
[ ...   ] If this problem persists, consider switching downloader via:
[ ...   ]     ghcup config set downloader Wget
[ Error ] [GHCup-00160] JSON decoding failed with: YAML exception:
[ ...   ] Yaml file not found: /home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml
[ ...   ] Consider removing /home/hasufell/.ghcup/cache/ghcup-0.0.7.yaml manually.
[ ...   ]
```

In the above example, this error happened because there was no internet connection. There can be other reasons, such as corrupted download.
The best way to debug this is to try to fetch the metadata manually:

```
curl https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml
```

Alternatively try with wget:

```
wget -O- https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml
```

If the download succeeds, but the error persists, try examining the file:

```
cat $(ghcup whereis cachedir)/ghcup-0.0.7.yaml
```

Fix your connection issues, make sure to delete `$(ghcup whereis cachedir)/ghcup-0.0.7.yaml` and then try again.
If you believe this is not a connection issue and there's something wrong with the file, please [open an issue here](https://github.com/haskell/ghcup-metadata/issues).

