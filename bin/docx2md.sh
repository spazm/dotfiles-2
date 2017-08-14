#!/usr/bin/env bash

DOCNAME=$1
DOCNAME_MD="$(echo $DOCNAME |  sed 's/docx/md/')"

pandoc \
  --wrap=preserve \
  -f docx \
  -t markdown \
  "$DOCNAME" \
  -o "$DOCNAME_MD"
