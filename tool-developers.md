# Recommendations for Tool Developers

The Haskell Error Index was started to document GHC error messages, but it will ideally be able to document messages from a variety of Haskell-related tooling.
After all, users don't necessarily know which tool produced a given message.
This document describes the expectations regarding error and warning codes for tools that would like to use this site, along with some recommended but not required practices.

## The Site

[errors.haskell.org](https://errors.haskell.org) is a community-driven site that maintains a collection of documentation for the errors and warnings that Haskell tools can emit.
The site is intentionally low-tech - it consists of a collection of example files and Markdown-formatted explanations, wrangled into HTML, CSS, and JavaScript by Hakyll.
The idea is that even quite new users will be able to submit updates to the site by using something like GitHub's online editor to create a pull request, and that those who want to work on the site don't first need to learn a complicated workflow or special tooling.

## Error Codes

To use this site, your tool should tag each documentable error or warning with a unique code in the form `[ABC-12345]`.
Here, `ABC` is a _namespace_ that is unique to your tool, and `12345` stands for a number.

The most important principle of error codes is that they exist primarily as a means of communication with users.
The code links the output in the user's IDE or terminal to text that describes the error or warning.
Codes should follow these principles:
 * A code should always have the same meaning forever
 * Codes may be retired or introduced in new releases

Aside from that, tools may assign codes however they wish, and need not do anything but begin emitting them.
There is an optional, recommended code assignment strategy later in this document.

Error codes are associated with the _meaning_ of a message, rather than its text.
As a tool evolves over time, codes should change if and only if the meaning of the message has changed.
That is, rephrasing a message or modifying its presentation should not result in a new code.
Splitting one message into two should result in at least one new code: if one of the new messages is a natural continuation of the prior one and one is a specific special case, then the special case should get a new code, but if neither is clearly the successor, then the prior code should be retired and fresh codes should be assigned to each of the new messages.
Like most forms of communication, this is a matter for human judgment that can't be automatically enforced.

### Error Code Lifecycle

Because error codes exist in a project-administered namespace, there is no need to check in with anyone else to start emitting a new error code.
A new release may add or remove as many codes as the developers wish, so long as a code is never used with two completely different meanings.
There is no obligation to document every error code prior to a release.
The codes are an opportunity for community members to help out, not a new obligation for busy tool developers.

Once a project has committed to the meaning of a code (typically by merging a PR that emits it into their `main` or `master` branch, but the specifics are up to each project), the message index will accept documentation.
Users and develoeprs need not wait for a release to begin documenting error codes.

### Namespaces

The Haskell Foundation administers the error code namespaces - please open an issue here or have a chat with the HF executive team to get a namespace assignment.
The currently assigned namespaces are:

| Namespace | Tool                                 |
|-----------|--------------------------------------|
| `GHC`     | [GHC](https://www.haskell.org/ghc/)  |


### Code Assignment Recommendations

We recommend that code assignment by a project follow these principles:

 1. Codes should not themselves reflect an ontology of messages (that is, don't use one numeric range for type errors, another for parser errors, another for optimizer errors).
    This is for a few reasons: codes may move between features over time but still have the same meaning (that is, the implementation of the tool should not be its interface), a sub-region may run out of codes, and sorting related messages together may make it harder to select the right one from a list.

 2. Codes should not be assigned sequentially based on the tool's source code, because this will likely seem to reflect an ontology and be misleading, and because sequentially assigned numbers are not very visually distinct.

 3. For tools that have long-lived development branches, there should be some mechanism in place to make code conflicts with other branches either obvious or unlikely, to decrease the risk of accidental re-use and/or spurious merge conflicts.
 
The strategy chosen for GHC was to uniformly sample codes from 0 to 99999, which satisfies all these principles.
Please feel free to do what makes sense for your project.
