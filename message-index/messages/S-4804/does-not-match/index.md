---
title: Package version does not match Stack configuration
---

The specific version of the package is not provided by the snapshot. The error that results from `stack build` is:
```text
 Error: [S-4804]
       Stack failed to construct a build plan.
       
       While constructing the build plan, Stack encountered the following exceptions:
       
       In the dependencies for blah-0.1.0.0:
           say-0.1.0.1 from Stack configuration does not match >=0.2.0.1 
       needed since blah is a build target.
       
       Some different approaches to resolving this:
       
         * Set 'allow-newer: true'
           in /home/USER/.stack/config.yaml to ignore all version constraints and build anyway.
```
