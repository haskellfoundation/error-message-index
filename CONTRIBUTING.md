# Contributing to the Message Index

Thank you for your interest in contributing! This site is a project of
the [Haskell Foundation](http://haskell.foundation), so the
[Guidelines for Respectful Communication](https://haskell.foundation/guidelines-for-respectful-communication/)
are in force.

The message index is in the directory `message-index`.

### Using a Recent-Enough Tool

If you want to contribute to the error message index, make sure that the version of the tool you have installed on your system is new enough. See the [README](README.md) for a table of supported versions.

You can manage multiple versions of tools on your system using [GHCup](https://www.haskell.org/ghcup/).

## If You Know Which Message You Want to Document

Let's say you ran across `GHC-00000` in the wild, but it wasn't yet documented
in the Haskell Message Index. You know a little about it and would like to help
out.

The simplest thing to do is create a new file in this repository,
`message-index/messages/GHC-00000/index.md`, and write your documentation there.

Here is a template you can use for the file [FIXME: use the tool provided by #408 when available.]:

```
---
title: <Your title for the message>
summary: <Your short summary, as a sentence.>
severity: <!-- Optional. one of `error` or `warning`. -->
introduced: <!-- Optional. Represents when the **code** for this message was added to the tool -->
flag: <!-- Optional. If it exists, list the tool's flag that enables this message -->
---

<Your description>
```

You can look at other messages in the Index to get a feel for the documentation style used in
this project.

To explore the full range of documentation possibilities, see [The Anatomy of a
Message][anatomy] below. It explains each of the fields in the header above, and includes
another example document for reference.

[anatomy]: #reference-the-anatomy-of-a-message

## If You *Don't* Know Which Message You Want to Document

Interested in helping out, but not sure where to start?

We keep track of which GHC errors are being worked on, and which still require documentation,
using a bunch of issues:

- [All error codes that still need documenting are collected here](https://github.com/haskellfoundation/error-message-index/issues/307). This issue contains links to individual issues for every error, allowing the list to be updated as PRs are merged. These individual issues for every error may also contain helpful links to test cases, suggestions on examples, and useful metadata to a contributor.
- There is also an (incomplete) list of issues tagged `good first issue`; these are errors which are especially good for newer contributors to document (no incredibly esoteric type-level errors that are hard to understand, let alone describe!): https://github.com/haskellfoundation/error-message-index/labels/good%20first%20issue

Once you've identified an issue you'd like to work on, refer to the previous section for how to get started.

### Helping With the Site Itself

There's more to the Message Index than messages!

- Issues related to improving the site, the workflow for contributing, or other information are tagged `error-message-index-site`: https://github.com/haskellfoundation/error-message-index/labels/error-message-index-site
- Issues related to improving, clarifying, or extending existing documentation are tagged `error-message-index-improvements`: https://github.com/haskellfoundation/error-message-index/labels/error-message-index-improvements


The site is generated using [Hakyll](https://jaspervdj.be/hakyll/).
Pull requests that make it easier to understand or navigate are very
welcome. The main generator `site.hs` is formatted using
[Ormolu](https://github.com/tweag/ormolu).

## Reference: The Anatomy of a Message

The Haskell Message Index is generated from a collection of files on
disk using Hakyll. This section describes those files.

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

Inside the top level of the site source, there is a
`messages` directory. Within `messages`, each subdirectory represents
a message whose name is the message code. This subdirectory contains a
file `index.md` that describes the message. Additionally,
subdirectories of the message directory may represent examples - each
example contains a file `index.md` as well as a number of Haskell,
Cabal, or YAML files that represent the example.

The path components `messages` and the two `index.md` files must be
named as specified here, while the other components may vary.

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

## Reference: How to Document a GHC Error Code

[FIXME I don't know how, or why, to follow these steps. Can someone who's submitted a
message explain it?]

To document a new error code, the following workflow can be convenient.
 1. Choose a code that you'd like to document, say `GHC-123`
 2. [FIXME: This is not an actionable step] One of the following modules in the `compiler` directory of the GHC source tree will have a method called `diagnosticCode` in the instance of `Diagnostic`:
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
