#!/usr/bin/env bash

DOCNAME=$1

pandoc \
  --wrap=preserve \
  -f docx \
  -t markdown \
  $DOCNAME.docx \
  -o $DOCNAME.md
