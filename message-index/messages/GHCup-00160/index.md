---
title: JSON decoding failed
summary: GHCup was unable to decode a JSON or YAML document (e.g. metadata file)
severity: error
introduced: 0.1.19.0
---

This error is most common when GHCup tries to fetch the metadata file that contains information
about available tool versions and binary distributions. This is done when GHCup starts, so basically
any command such as `list`, `tui`, `install`, etc. can throw this.

Potential underlying causes for this errors are:

* No internet connection
* Unreliable disk or Internet leading to a corrupted file
* Non-functional `curl` or `wget` (users have reported difficulties when these tools are installed through [snap](https://snapcraft.io/))
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

If you use `ghcup --metadata-fetching-mode=Strict list`, then you'll likely receive error
[GHCup-05841](https://errors.haskell.org/messages/GHCup-05841/) instead.

The best way to debug this is to try to fetch the metadata manually:

```
cd "$(ghcup whereis cachedir)"
curl https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml
```

Alternatively try with wget:

```
cd "$(ghcup whereis cachedir)"
wget -O- https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.7.yaml
```

If the download fails, your curl/wget installation might be broken. On linux, make sure you've installed
these from your package manager and not via [snap](https://snapcraft.io/) or similar. On Windows, make
sure you use `curl.exe` and not `curl` (which is a cmdlet) when testing. It should be pre-installed.

If the download succeeds, but the error persists, try examining the file and verify that it's valid YAML:

```
cat "$(ghcup whereis cachedir)/ghcup-0.0.7.yaml"
```

Fix your connection issues, make sure to delete `$(ghcup whereis cachedir)/ghcup-0.0.7.yaml` and then try again.
If you believe this is not a connection issue and there's something wrong with the file, please [open an issue here](https://github.com/haskell/ghcup-metadata/issues).

