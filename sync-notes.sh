#!/bin/bash

cd ~/notes || exit

# Update sidebar
docsify-auto-sidebar --folder ~/notes --output ~/notes/_sidebar.md --config false

# Git add
git add .

# Only commit if there are staged changes
git diff --cached --quiet || git commit -m "Sync: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push

# Success message
echo "✅ Notes synced and sidebar updated at $(date '+%H:%M:%S')"
