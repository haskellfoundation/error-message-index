#! /bin/bash

defHask="module $2 where


"
defIndex="---
title: TITLE HERE
summary: SUMMARY HERE
severity: error
introduced: 9.6.1
---

DESC HERE"
defExampleindex="---
title: TITLE HERE
---

BODY HERE

## Error Message
\`\`\`
ERROR HERE
\`\`\`"

git checkout -b "GHC-$1"
mkdir "messages/GHC-$1"
mkdir "messages/GHC-$1/example1"
mkdir "messages/GHC-$1/example1/before"
mkdir "messages/GHC-$1/example1/after"
echo "$defIndex" > "messages/GHC-$1/index.md"
echo "$defExampleindex" > "messages/GHC-$1/example1/index.md"
echo "$defHask" > "messages/GHC-$1/example1/before/$2.hs"
echo "$defHask" > "messages/GHC-$1/example1/after/$2.hs"
