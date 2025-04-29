#!/bin/bash

set -e

generate_nav() {
    local indent="$1"
    local path="$2"

    for dir in $(find "$path" -mindepth 1 -type d | sort); do
        local relpath="${dir#docs/}"
        local name="$(basename "$relpath")"
        local title="${name//-/ }"

        # Skip assets folder
        if [[ "$relpath" == assets* ]]; then
            continue
        fi

        echo "${indent}- ${title^}:"
        generate_nav "  $indent" "$dir"
    done

    for file in "$path"/*.md; do
        [ -e "$file" ] || continue
        local relpath="${file#docs/}"
        local name="$(basename "$file" .md)"
        local title="${name//-/ }"
        echo "${indent}- ${title^}: $relpath"
    done
}

# Save only the top site settings (stop before any nav:)
awk '/^nav:/{exit} {print}' mkdocs.yml > mkdocs.yml.tmp

# Write the correct nav header
echo "nav:" >> mkdocs.yml.tmp

# Generate navigation based on docs folder
generate_nav "  " "docs" >> mkdocs.yml.tmp

# Replace old mkdocs.yml
mv mkdocs.yml.tmp mkdocs.yml

echo "✅ mkdocs.yml nav updated cleanly!"
