#!/usr/bin/env bash
set -e

# Default directory to search
SEARCH_DIR="${SEARCH_DIR:-/data}"

# Ensure at least one argument is provided
if [ "$#" -eq 0 ]; then
  echo "Usage: docker_entrypoint.sh <command> [args...]"
  echo "Example: docker run image grep foo"
  exit 1
fi

# Run command for each file found
find "$SEARCH_DIR" -type f -print0 | while IFS= read -r -d '' file; do
  echo "Processing: $file"
  "$@" "$file"
done