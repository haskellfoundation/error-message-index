# The Haskell Message Index
[![.github/workflows/deploy.yml](https://github.com/haskellfoundation/error-message-index/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/haskellfoundation/error-message-index/actions/workflows/deploy.yml)

Haskell tooling emits a variety of errors, warnings, and other messages. In an unreleased branch, GHC emits a unique code for each message that allows it to be identified. This site allows these codes to be looked up, providing examples, context, and further information that can make them easier to understand.

Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for instructions on improving the site. Thanks!

## Running Locally

The site is built with the [Hakyll](https://jaspervdj.be/hakyll/) static site generator. To view the site locally, enter the `message-index` directory and run:
```
$ cabal run -- site watch
```
or
```
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

## Contributor Expectations

We welcome contributions that help to further progress the project towards its goals.

Contributions may come in the form of changes to the code base, as well as opening or commenting on issues and pull requests.

All contributors are expected to follow the [Haskell Foundation's Code of Conduct](https://haskell.foundation/guidelines-for-respectful-communication/).


## Maintenance

The Message Index is a project of the [Haskell Foundation](http://haskell.foundation). Please get in touch if you have ideas, requests, or any other feedback!

