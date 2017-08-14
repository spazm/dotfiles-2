#!/usr/bin/env bash

if [[ ! $(which pandoc) ]]; then
  echo "Please install pandoc from https://pandoc.org/installing.html"
  exit 1
elif [[ -z $1 ]]; then
  echo "Please provide the name of the .docx file you wish to convert to Markdown"
  echo "E.g. \`~/bin/docx2md foobar.dox\`"
  exit 1
fi

DOCNAME=$1
DOCNAME_MD="$(echo $DOCNAME |  sed 's/docx/md/')"

pandoc \
  --wrap=preserve \
  -f docx \
  -t markdown \
  "$DOCNAME" \
  -o "$DOCNAME_MD"
