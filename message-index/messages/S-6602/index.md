---
title: Could not parse YAML configuration file
summary: Test summary
severity: error
introduced: 2.9.3
---

This error occurs when Stack is unable to parse a YAML configuration file, which could be a project-level `stack.yaml` file or a global `config.yaml` file. The error covers the following situations:

 * The specified configuration file does not exist
 * The configuration file is not well-formed YAML
 * The file is well-formed YAML but does not match the expected data schema
 
The expected file formats are described in [the Stack documentation](https://docs.haskellstack.org/en/stable/yaml_configuration/).
