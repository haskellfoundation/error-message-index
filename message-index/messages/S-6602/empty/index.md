---
title: Stack does not accept empty YAML files
---

When run with an empty YAML file, Stack fails to parse it. In particular, `stack --stack-yaml empty.yaml build` results in the error:
```
Error: [S-6602]
Could not parse '/PATH/TO/empty.yaml':
Aeson exception:
Error in $: parsing ProjectAndConfigMonoid failed, expected Object, but encountered Null
See http://docs.haskellstack.org/en/stable/yaml_configuration/
```

This can be fixed by specifying a resolver, which is the minimal `stack.yaml` configuration.
