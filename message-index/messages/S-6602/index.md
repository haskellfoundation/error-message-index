---
title: Could not parse YAML configuration file
summary: Test summary
severity: error
introduced: 2.10.0
---

This error occurs when Stack is unable to parse a `stack.yaml` file. The error covers the following situations:

 * The specified configuration file does not exist
 * The configuration file is not well-formed YAML
 * The file is well-formed YAML but does not match the expected data schema
 
The expected file format is described in [the Stack documentation](https://docs.haskellstack.org/en/stable/yaml_configuration/).
