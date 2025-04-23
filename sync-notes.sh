#!/bin/bash

cd ~/notes || exit

# Update sidebar
bash ~/notes/generate-sidebar.sh

# Git add
git add .

# Only commit if there are staged changes
git diff --cached --quiet || git commit -m "Sync: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push

# Success message
echo "✅ Notes synced and sidebar updated at $(date '+%H:%M:%S')"
