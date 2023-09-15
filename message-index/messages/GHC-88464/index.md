---
title: Variable not in scope
summary: An unknown variable name was referenced.
introduced: 9.6.1
severity: error
---

This error means that a variable name used in a program can't be matched up with a corresponding _binding site_.

In Haskell, every variable comes into existence at a specific location. Examples include function argument names, local definitions with `let`, and module-level definitions. Creating a new name like this is called _binding_ it, and the area of the program that can refer to the new name is called its _scope_. The message means that the provided name is not available for reference right where it is referred to.

A common situation where this error occurs is when the programmer forgets to import some name from a module. In that case, the solution is to add the missing import declaration.

## Example error text

```
error: [GHC-88464] Variable not in scope: x
```

```
error: [GHC-88464] Variable not in scope: sort :: [Int] -> [Int]
```
