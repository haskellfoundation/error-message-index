# Error Message Flashcards

These flash cards are a promotional tool to get more people involved in contributing documentation to the error message index.
We can prepare these index cards and bring them to events such as Zurihac
so that people can "adopt" an error message that has not yet been documented.

## How to generate the index cards

In a checkout of the GHC codebase, run `./hadrian/build lint:codes`.
This builds the `lint-codes` executable which can emit useful information about all the error messages that GHC generates.
Then, use `_build/stage1/bin/lint-codes list > all_error_codes.txt` to generate the list of all error codes and write them to a file. Copy this file into this directory.

Next, copy the file `testsuite/tests/diagnostic-codes/codes.stdout` from the GHC codebase. This file contains all the GHC error codes which have no corresponding test in the GHC testsuite. Remove the start of the file by hand.

Then, run the `filter_codes.sh` script. This removes all error codes which are already documented and all errors which don't have a testcase in the GHC testsuite.

Lastly, run `latexmk` to obtain the index cards.
