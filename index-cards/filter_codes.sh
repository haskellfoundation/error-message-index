#!/bin/bash

# This script presumes that you have already followed the instructions to generate the file "all_error_codes.txt" from the GHC repository.

# Create a list of all documented GHC error messages
ls ../message-index/messages | grep GHC- > documented_error_codes.txt

# Subtract from the list "all_error_codes" those which are already documented.
grep -v -f documented_error_codes.txt all_error_codes.txt > undocumented_error_codes.txt

# Subtract from this list all those error codes which are not tested in the GHC testsuite: It is unclear whether these error codes are reachable at all, so it is unclear if we should document them at all.
awk '{print substr($1, 2, length($1) - 2)}' codes.stdout > untested_error_codes.txt
grep -v -f untested_error_codes.txt undocumented_error_codes.txt > good_candidates.txt

# Generate the content.tex from good_candidates.tex
awk 'NF > 0 {print "\\ghcerror{" substr($1, 2, length($1) -2) "}{" substr($2, 2, length($2) -2) "}"}' good_candidates.txt > content.tex
