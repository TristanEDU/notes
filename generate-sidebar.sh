#!/bin/bash

OUTPUT_FILE="_sidebar.md"
ROOT_DIR="$(pwd)"

echo "# 📚 Notes Index" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

generate_links() {
  local DIR="$1"
  local INDENT="$2"

  for FILE in "$DIR"/*.md; do
    [ -f "$FILE" ] || continue
    FILE_NAME=$(basename "$FILE")
    [[ "$FILE_NAME" == "_sidebar.md" ]] && continue
    REL_PATH="${FILE#$ROOT_DIR/}"
    echo "${INDENT}- [${FILE_NAME%.md}](${REL_PATH})" >> "$OUTPUT_FILE"
  done

  for SUBDIR in "$DIR"/*/; do
    [ -d "$SUBDIR" ] || continue
    SUBDIR_NAME=$(basename "$SUBDIR")
    echo "${INDENT}- ${SUBDIR_NAME}" >> "$OUTPUT_FILE"
    generate_links "$SUBDIR" "$INDENT  "
  done
}

generate_links "$ROOT_DIR" ""

echo "✅ _sidebar.md generated!"
