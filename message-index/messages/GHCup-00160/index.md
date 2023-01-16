---
title: JSON decoding failed
summary: GHCup was unable to decode a JSON document (e.g. metadata file)
severity: error
introduced: 0.1.19.0
---

The most common cause for this error is when GHCup tries to fetch the metadata file that contains information
about available tool versions and binary distributions. This is done when GHCup starts, so basically
any command such as `list`, `tui`, `install`, etc. can throw this.

Potential underlying causes for this errors are:

* No internet connection
* Unreliable disk or Internet leading to a corrupted file
* Malformed metadata file, indicating an issue in the [ghcup-metadata](https://github.com/haskell/ghcup-metadata) repository

As an example with no internet connection, GHCup  will fail to list available tools:

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

