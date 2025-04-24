#!/bin/bash

set -e

generate_nav() {
    local indent="$1"
    local path="$2"

    # Loop through folders first
    for dir in $(find "$path" -mindepth 1 -type d | sort); do
        local relpath="${dir#docs/}"
        local name="$(basename "$relpath")"
        local title="${name//-/ }"
        echo "${indent}- ${title^}:"
        generate_nav "  $indent" "$dir"
    done

    # Then add markdown files in the current folder
    for file in "$path"/*.md; do
        [ -e "$file" ] || continue
        local relpath="${file#docs/}"
        local name="$(basename "$file" .md)"
        local title="${name//-/ }"
        echo "${indent}- ${title^}: $relpath"
    done
}

# Write to mkdocs.yml, preserving top settings
head -n 20 mkdocs.yml | grep -v "^nav:" > mkdocs.yml.tmp

# Append updated nav
echo "nav:" >> mkdocs.yml.tmp
generate_nav "  " "docs" >> mkdocs.yml.tmp

# Replace old file
mv mkdocs.yml.tmp mkdocs.yml

echo "✅ mkdocs.yml nav updated!"
