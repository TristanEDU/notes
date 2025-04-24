#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

echo "site_name: My Notes" > mkdocs.yml
echo "theme:" >> mkdocs.yml
echo "  name: material" >> mkdocs.yml
echo "  palette:" >> mkdocs.yml
echo "    scheme: slate" >> mkdocs.yml
echo "  features:" >> mkdocs.yml
echo "    - navigation.sections" >> mkdocs.yml
echo "    - navigation.top" >> mkdocs.yml
echo "    - navigation.expand" >> mkdocs.yml
echo "    - toc.integrate" >> mkdocs.yml
echo "    - search.suggest" >> mkdocs.yml
echo "    - content.code.copy" >> mkdocs.yml
echo "" >> mkdocs.yml
echo "nav:" >> mkdocs.yml
echo "  - Home: index.md" >> mkdocs.yml

find docs -name "*.md" | grep -v "index.md" | sort | while read -r file; do
  name=$(basename "$file" .md | sed -E 's/-/ /g' | sed -E 's/(^| )(\w)/\U\2/g')
  relpath=$(realpath --relative-to=docs "$file")
  echo "  - $name: $relpath" >> mkdocs.yml
done
