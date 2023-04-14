# Contributing to the Message Index

Thank you for your interest in contributing! This site is a project of
the [Haskell Foundation](http://haskell.foundation), so the
[Guidelines for Respectful Communication](https://haskell.foundation/guidelines-for-respectful-communication/)
are in force.

The message index is in the directory `message-index`.

## Using a Recent-Enough GHC

Starting with version 9.6, GHC emits a unique error code with each error message.
If you want to contribute to the error message index, make sure that the version of GHC you have installed on your system is 9.6 or newer.

You can test which version of GHC you are using on the command line:

```console
> ghc --version
The Glorious Glasgow Haskell Compilation System, version 9.6.1
```

You can manage multiple versions of GHC on your system using [GHCup](https://www.haskell.org/ghcup/).



## How to Document a GHC Error Code

To document a new error code, the following workflow can be convenient.
 1. Choose a code that you'd like to document, say `GHC-123`
 2. One of the following modules in the `compiler` directory of the GHC source tree will have a method called `diagnosticCode` in the instance of `Diagnostic`:
   * `GHC.Tc.Errors.Ppr` (error constructors starting `Tc`)
   * `GHC.Driver.Errors.Ppr` (error constructors starting `Driver`)
   * `GHC.Parser.Errors.Ppr` (error constructors starting `Pc`)
   * `GHC.HsToCore.Errors.Ppr` (error constructors starting `Ds`)
 3. Once the code has been found, identify the error datatype constructor that produces it.
 4. The documentation for the constructor will be in one of the following modules. Read the Haddock for an explanation of the error's meaning:
   * `GHC.Tc.Errors.Types`
   * `GHC.Driver.Errors.Types`
   * `GHC.Parser.Errors.Types`
   * `GHC.HsToCore.Errors.Types`
 5. Find the pretty-printer for the error constructor in the `X.Ppr` module. This will give an idea of how the message looks when rendered.
 6. Grep the `testsuite` directory for the error text to find examples that trigger the error.
 7. Follow the instructions below to create a page with an explanation and examples.

### Task Lists

We keep track of which GHC errors are being worked on, and which still require documentation,
using a bunch of issues:

- [All error codes that still need documenting are collected here](https://github.com/haskellfoundation/error-message-index/issues/162). This issue contains links to individual issues for every error, allowing the list to be updated as PRs are merged. These individual issues for every error may also contain helpful links to test cases, suggestions on examples, and useful metadata to a contributor.
- There is also an (incomplete) list of issues tagged `good first issue`; these are errors which are especially good for newer contributors to document (no incredibly esoteric type-level errors that are hard to understand, let alone describe!): https://github.com/haskellfoundation/error-message-index/labels/good%20first%20issue
- Issues related to improving the site, the workflow for contributing, or other information are tagged `error-message-index-site`: https://github.com/haskellfoundation/error-message-index/labels/error-message-index-site
- Issues related to improving, clarifying, or extending existing documentation are tagged `error-message-index-improvements`: https://github.com/haskellfoundation/error-message-index/labels/error-message-index-improvements

## Stack and Error Codes

Since version 2.9.3, Stack has supported error codes in the `S-` namespace.

## GHCup and Error Codes

Since version 0.1.19.0, GHCup has supported error codes in the `GHCup-` namespace.

## Contributing New Messages

The Haskell Message Index is generated from a collection of files on
disk using Hakyll. Inside the top-level of the site source, there is a
`messages` directory. Within `messages`, each subdirectory represents
a message whose name is the message code. This subdirectory contains a
file `index.md` that describes the message. Additionally,
subdirectories of the message directory may represent examples - each
example contains a file `index.md` as well as a number of Haskell,
Cabal, or YAML files that represent the example.

A message with ID `GHC-123` and two examples might have the following structure:

 * `/messages` - the root of all messages
   * `/messages/GHC-123` - data corresponding to message `GHC-123`
     * `/messages/GHC-123/index.md` - description and metadata for `GHC-123`
     * `/messages/GHC-123/example1/` - files related to the first example
     * `/messages/GHC-123/example1/index.md` - description and metadata for the first example
     * `/messages/GHC-123/example1/before/Main.hs` - an example file that exhibits the error
     * `/messages/GHC-123/example1/after/Main.hs` - an example file in which the error has been fixed
     * `/messages/GHC-123/example2/` - files related to the second example
     * `/messages/GHC-123/example2/index.md` - description and metadata for the second example
     * `/messages/GHC-123/example2/before/Main.hs` - an example file that exhibits the error
     * `/messages/GHC-123/example2/after/Main.hs` - an example file in which the error has been fixed

The path components `messages` and the two `index.md` files must be
named as specified here, while the other components may vary.

You can also use the `makeFolder.sh` templating script. Usage is as follows:

```bash
./makeFolder.sh <NAMESPACE>-<NUMERIC_ERROR_CODE> <HaskellModuleName>
```

This will generate a folder called `NAMESPACE-NUMERIC_ERROR_CODE` containing an empty `index.md` file, a subfolder called `example1` with a corresponding `index.md`, and two blank `before`/`after` Haskell source files. Use `GHC` as `NAMESPACE` to document GHC error messages, and `S` as `NAMESPACE` to document Stack errors.

### Message Descriptions

Message descriptions (in `index.md` in the message directory) are
written in Markdown with Pandoc-style metadata blocks. Here's an
example message description:

````markdown
---
title: Unification error
summary: Two types that should match are in conflict.
introduced: 9.4.1
severity: error
---


A unification error occurs when the type checker has received conflicting expectations about an expression's type.


## Example Text

```
Unification error: Expected type A but got type B
```
````

The fields in the metadata block should be:
 * `title` - a short title used for the page header and for links to the description, in regular sentence case (First word capitalised only, no ending `.`)
 * `summary` - a short summary used in the message index, in regular sentence case (and finished with a `.`)
 * `introduced` - the tool version in which the error code was introduced (optional)
 * `removed` - if the message was removed, the first version which no longer produces this message (optional)
 * `flag` - the flag which enables this warning (optional). Use `-Wfoo`, not `-fwarn-foo`.
 * `extension` - the language extension which has to be enabled in order for this message to be emitted (optional)

### Example Descriptions

Example descriptions are written in Markdown with Pandoc-style
metadata, just like message descriptions. They have only the `title`
field. All `.hs` files are shown in the list of files for the
example. The `index.md` file should explain how the files illustrate
the message.

## Contributing to the Site

The site is generated using [Hakyll](https://jaspervdj.be/hakyll/).
Pull requests that make it easier to understand or navigate are very
welcome. The main generator `site.hs` is formatted using
[Ormolu](https://github.com/tweag/ormolu).
