# The Haskell Message Index
[![.github/workflows/deploy.yml](https://github.com/haskellfoundation/error-message-index/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/haskellfoundation/error-message-index/actions/workflows/deploy.yml)

**View the site →** https://errors.haskell.org/

Haskell tooling emits a variety of errors, warnings, and other messages. In recent versions, some of these tools emit a unique code for each message that allows it to be identified. This site allows these codes to be looked up, providing examples, context, and further information that can make them easier to understand.

## Supported Tools

Today, the Haskell Message Index supports three tools. Any user-facing Haskell-related programming tools are welcome to join the effort!

| Tool  | Earliest supported version | Namespace | Link to subpage |
|-------|----------------------------|-----------|-----------------|
| GHC   | 9.6.1                      | `GHC-`    | [/ghc](https://errors.haskell.org/ghc) |
| Stack | 2.9.3                      | `S-`      | [/stack](https://errors.haskell.org/stack) |
| GHCup | 0.1.19.0                   | `GHCup-`  | [/ghcup](https://errors.haskell.org/ghcup) |
| Cabal | 3.12                       | `Cabal-`  | [/cabal](https://errors.haskell.org/cabal) |

## Contributing to the Message Index

Contributions may come in the form of changes to the code base, as well as opening or commenting on issues and pull requests. You are warmly invited to participate!

Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for instructions on improving the site. Thanks!

If you're a Haskell tool developer who would like to integrate your project with the site, please refer to [tool-developers.md](./tool-developers.md) for recommendations regarding the error codes themselves.

## Maintenance

The Message Index is a project of the [Haskell Foundation](http://haskell.foundation), maintained on a volunteer basis by David Binder (@BinderDavid). Please get in touch if you have ideas, requests, or any other feedback!



