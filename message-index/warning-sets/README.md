This directory contains a small tool to extract the warning sets from GHC.

This program uses the GHC API (starting with GHC-9.5) to produce a mapping from
from warning flag to whether it is on by default or not, and which warning
flags would enable it.

Compile it with

    ghc -package ghc warning-sets.hs

and then run it

    ./warning-sets

It prints the result on standard out in Haskell Show/Read format of type

    [(String, (Bool, String))]

e.g. (spaces added for clarity)

    [ ("-Wduplicate-exports",True,["`-Wdefault`"])
    , ("-Wduplicate-constraints",False,[])
    , ("-Wredundant-constraints",False,[])
    , ("-Whi-shadowing",False,["`-Wall`"])
    , ("-Wimplicit-prelude",False,[])
    , ("-Wincomplete-patterns",False,["`-Wextra`"])
    …

Since this data changes irregularly, we store the result from this tool in
`warning-sets-9.5.txt`.

As more versions of GHC are supported, we may choose display the information
for all supported versions.
