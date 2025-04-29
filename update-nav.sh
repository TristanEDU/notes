#!/bin/bash

set -e

generate_nav() {
    local indent="$1"
    local path="$2"
    local relpath="${path#docs/}"

    # Skip assets folder
    if [[ "$relpath" == assets* ]]; then
        return
    fi

    # Folder title
    local name="$(basename "$relpath")"
    local title="${name//-/ }"

    echo "${indent}- ${title^}:"

    # Recursively add subfolders first
    for dir in $(find "$path" -mindepth 1 -type d | sort); do
        generate_nav "  $indent" "$dir"
    done

    # Then add .md files
    for file in "$path"/*.md; do
        [ -e "$file" ] || continue
        local relfile="${file#docs/}"
        local fname="$(basename "$file" .md)"
        local title="${fname//-/ }"
        echo "${indent}- ${title^}: $relfile"
    done
}

# Clean mkdocs.yml top block (stop copying manual junk)
awk '/^nav:/ {exit} {print}' mkdocs.yml > mkdocs.yml.tmp

# Append new nav
echo "nav:" >> mkdocs.yml.tmp
generate_nav "  " "docs" >> mkdocs.yml.tmp

# Replace old file
mv mkdocs.yml.tmp mkdocs.yml

echo "✅ mkdocs.yml nav updated (assets skipped)!"
