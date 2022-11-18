---
title: Not a YAML file
---

This `stack.yaml` file is not syntactically valid YAML. The error that results from `stack --stack-yaml not.yaml build` is:
```text
Error: [S-6602]
Could not parse '/PATH/TO/not.yaml':
YAML parse exception at line 0, column 0,
while parsing a block node:
did not find expected node content
See http://docs.haskellstack.org/en/stable/yaml_configuration/
```
