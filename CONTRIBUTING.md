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
out. Here's how you can document it, using a command-line tool found in this
repository.

*(If you aren't familiar with git, you can simply [create a new
issue][new-issue] and someone will help you out.)*

[new-issue]: https://github.com/haskellfoundation/error-message-index/issues/new

1. Change to the `message-index` directory.
2. Execute the cabal script `./create-message-template.hs` and answer the questions.
3. Optionally commit the new files and create a draft pull request right away.

The files created by the tool will need further editing, but it's never too
early to get feedback by opening an issue or pull request.

Here is a collection of other tips:

- To explore the full range of documentation possibilities, see [The Anatomy of
  a Message][anatomy] below. It explains each of the fields in the header above,
  and includes another example document for reference.
- Remember to search the tool's source code for the error number to learn more about
  it! Your error may already have code documentation or examples in the test suite.
- You can also look at other messages in the Index to get a feel for the
  documentation style used in this project.

[anatomy]: #reference-the-anatomy-of-a-message

## If You *Don't* Know Which Message You Want to Document

Interested in helping out, but not sure where to start?

We keep track of which GHC errors are being worked on and which still require documentation.

- [All error codes that still need documenting are collected here](https://github.com/haskellfoundation/error-message-index/issues/307). This issue contains links to individual issues for every error, allowing the list to be updated as PRs are merged. These individual issues for every error may also contain helpful links to test cases, suggestions on examples, and useful metadata to a contributor.
- There is also an (incomplete) list of issues tagged `good first issue`; these are errors which are especially good for newer contributors to document (no incredibly esoteric type-level errors that are hard to understand, let alone describe!): https://github.com/haskellfoundation/error-message-index/labels/good%20first%20issue
- Issues related to improving, clarifying, or extending existing documentation are tagged `error-message-index-improvements`: https://github.com/haskellfoundation/error-message-index/labels/error-message-index-improvements

Once you've identified an issue you'd like to work on, refer to the previous section for how to get started.

## Helping With the Site Itself

There's more to the Message Index than messages!

Issues related to improving the site, the workflow for contributing, or other information are tagged `error-message-index-site`: https://github.com/haskellfoundation/error-message-index/labels/error-message-index-site


The site is generated using [Hakyll](https://jaspervdj.be/hakyll/).
Pull requests that make it easier to understand or navigate are very
welcome. The main generator `site.hs` is formatted using
[Ormolu](https://github.com/tweag/ormolu). See [Technology
choices][tech-choices] below for more info.

[tech-choices]: #reference-technology-choices

### Running Locally

The site is built with the [Hakyll](https://jaspervdj.be/hakyll/) static site generator. To view the site locally, enter the `message-index` directory and run:
```console
$ cabal run -- site watch
```
or
```console
$ stack run -- site watch
```
which fires up an HTTP server on `localhost:8000`.

The error messages:
```
cabal: There is no <pkgname>.cabal package file or cabal.project file. To
build packages locally you need at minimum a <pkgname>.cabal file. You can use
'cabal init' to create one.

For non-trivial projects you will also want a cabal.project file in the root
directory of your project. This file lists the packages in your project and
all other build configuration. See the Cabal user guide for full details.
```
and
```
No executables found.
```
typically indicate that the site was started from the root of the repository, rather than the `message-index` directory.

### `create-message-template`

If you want to work on the scaffolding tool itself, note that it has a test script at
`test/create-message-template/test.sh`.

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
metadata, just like message descriptions. They have the obligatory `title`
and optional `order` fields. All `.hs` files are shown in the list of files for the
example. The `index.md` file should explain how the files illustrate
the message.

Examples are ordered according to their `order` field. Examples
with no explicit `order` are shown last and examples with the same
`order` will be shown in an unspecified order with respect to each other,
but will appear before examples with a greater order.

## Reference: Technology choices

### JS

The website generated by `message-index` uses a few JS components.

 - [highlight.js](https://highlightjs.org/) for highlighting blocks of code. [License: BSD 3-Clause](https://github.com/highlightjs/highlight.js/blob/main/LICENSE).
 - [TableFilter](http://www.tablefilter.com/) for the filtering functionality in the error message table. [License: MIT](https://github.com/koalyptus/TableFilter/blob/master/LICENSE).

### Nix flake

The Nix flake uses [flake-parts](https://flake.parts/), as well as the flake-parts modules for
- [haskell-flake](https://github.com/srid/haskell-flake) ([haskell-flake flake-parts module](https://flake.parts/options/haskell-flake))
- [devshell](https://github.com/numtide/devshell) ([devshell flake-parts module](https://flake.parts/options/devshell))
 
Generally speaking, we choose technology for this site based on the following criteria:

 * The build process for the site should be simple, relying on no build tools or package managers aside from `cabal` or `stack`
 * CSS and Javascript code should be straightforward to maintain by someone who has only rudimentary front-end development skills
 * The generated site should consist only of static files that can be hosted anywhere
 * URLs should be predictable, and easy for external tools to generate (e.g. so IDEs can link to error documentation)
