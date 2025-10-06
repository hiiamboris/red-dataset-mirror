#!/bin/bash

# Sanitize filenames deeply by replacing '*' -> 'any' and '?' -> '_'

set -euo pipefail
shopt -s globstar nullglob

# Loop over all files and directories, deepest first (so renaming directories won't break paths)
find . -depth -print0 | while IFS= read -r -d '' path; do
  dir=$(dirname "$path")
  base=$(basename "$path")

  # Replace * with 'any' and ? with '_'
  newbase=${base//\*/any}
  newbase=${newbase//\?/_}

  # Skip if no change
  if [[ "$base" == "$newbase" ]]; then
    continue
  fi

  newpath="$dir/$newbase"

  # Avoid overwriting existing files
  if [[ -e "$newpath" ]]; then
    echo "⚠️  Skipping '$path' — '$newpath' already exists."
    continue
  fi

  echo "Renaming: '$path' → '$newpath'"
  mv -- "$path" "$newpath"
done

echo "✅ Filename sanitization complete."
