#!/bin/bash

set -e

generate_nav() {
    local indent="$1"
    local path="$2"
    local relpath="${path#docs/}"
    local name="$(basename "$relpath")"
    local title="${name//-/ }"

    # Handle assets folder with image files
    if [[ "$relpath" == assets* ]]; then
        echo "${indent}- ${title^}:"
        for file in "$path"/*.{png,jpg,jpeg,gif,svg,webp}; do
            [ -e "$file" ] || continue
            local imgrel="${file#docs/}"
            local imgname="$(basename "$imgrel")"
            echo "${indent}  - $imgname: $imgrel"
        done
        return
    fi

    # Default folder recursion
    for dir in $(find "$path" -mindepth 1 -type d | sort); do
        generate_nav "  $indent" "$dir"
    done

    # Add .md files for all other folders
    for file in "$path"/*.md; do
        [ -e "$file" ] || continue
        local relfile="${file#docs/}"
        local fname="$(basename "$file" .md)"
        local title="${fname//-/ }"
        echo "${indent}- ${title^}: $relfile"
    done
}


#paste to mkdocs.yml, preserving top settings
head -n 20 mkdocs.yml | grep -v "^nav:" > mkdocs.yml.tmp

# Append updated nav
echo "nav:" >> mkdocs.yml.tmp
generate_nav "  " "docs" >> mkdocs.yml.tmp

# Replace old file
mv mkdocs.yml.tmp mkdocs.yml

echo "✅ mkdocs.yml nav updated!"
