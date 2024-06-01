# Error Message Flashcards

These flash cards are a promotional tool to get more people involved in contributing error messages.
We can prepare these index cards with undocumented error messages and bring them to events such as Zurihac
so that people can "adopt" an error message.

You can build the index cards by invoking `latexmk`.


## How to generate a list of error messages which are undocumented

In a checkout of the GHC codebase, run `./hadrian/build lint:codes`.
This builds the `lint-codes` executable which can emit useful information about all the Error messages that can be emitted.
Then, use `_build/stage1/bin/lint-codes list > all_error_codes.txt` to generate the list of all error codes and write them to a file.

Next, copy the file `testsuite/tests/diagnostic-codes/codes.stdout` from the GHC codebase. This file contains all the GHC error codes which have no corresponding test in the GHC testsuite. Remove the start of the file by hand.

