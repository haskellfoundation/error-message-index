---
title: Stack does not accept empty YAML files
---

When run with an empty YAML file, Stack fails to parse it. For example, `stack --stack-yaml empty.yaml build` results in the error:
```
Error: [S-6602]
       Stack could not load and parse /PATH/TO/empty.yaml as a YAML
       configuraton file.
       
       While loading and parsing, Stack encountered the following exception:
       
       Aeson exception:
       Error in $: parsing ProjectAndConfigMonoid failed, expected Object, but encountered Null
       
       For help about the content of Stack's YAML configuration files, see (for the most recent release of
       Stack) http://docs.haskellstack.org/en/stable/yaml_configuration/.
```

This can be fixed by specifying a resolver, which is the minimal `stack.yaml` configuration.
