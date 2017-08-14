#!/usr/bin/env bash
                                                                                
usage() {
  echo "Usage: $0 [docx filenames]"
  echo ""
  echo "Converts docx files created by google doc into markdown via pandoc"
  exit 2
}

# check for pandoc.
#   Uses posix specified `command -v` for portability and to avoid a subshell.
check_pandoc() {
  command -v pandoc >/dev/null 2>&1 || \
    { 
      echo "Please install pandoc from https://pandoc.org/installing.html" ;
      exit 1
    }
}

# convert one docx to markdown.
#   output filename is input ".docx" with suffix removed if present
#   and ".md" appended.
convert_doc() {
  DOCNAME="$1"
  # ${FOO%BAR} returns $FOO, removing BAR if present on the right end of string
  DOCNAME_MD="${DOCNAME%.docx}.md"
  
  pandoc \
    --wrap=preserve \
    -f docx \
    -t markdown \
    "$DOCNAME" \
    -o "$DOCNAME_MD"
    echo "$DOCNAME_MD has been generated for you. 🔮"
}


check_pandoc
if [ $# -eq 0 ]; then
  usage
fi
for doc in "$@"; do
  convert_doc "$doc"
done