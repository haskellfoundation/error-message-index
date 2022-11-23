---
title: Not a YAML file
---

This `stack.yaml` file is not syntactically valid YAML. The error that results from `stack --stack-yaml not.yaml build` is:
```text
Error: [S-6602]
       Stack could not load and parse /PATH/TO/not.yaml as a YAML configuraton file.

       While loading and parsing, Stack encountered the following exception:

       YAML parse exception at line 0, column 0,
       while parsing a block node:
       did not find expected node content

       For help about the content of Stack's YAML configuration files, see (for the most recent release of
       Stack) http://docs.haskellstack.org/en/stable/yaml_configuration/.
```
