#!/bin/bash

cd ~/notes || exit

# Git add
git add .

# Only commit if there are staged changes
git diff --cached --quiet || git commit -m "Sync: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push

# Success message
echo "✅ Notes synced and updated at $(date '+%H:%M:%S')"
