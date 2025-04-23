#!/bin/bash

cd ~/notes || exit

# Update sidebar
docsify-auto-sidebar --folder . --output ./_sidebar.md

git add .
git commit -m "Sync: $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null
git push
