#!/bin/bash

# Exit on any error
set -e

# Format time
NOW=$(date "+%Y-%m-%d %H:%M:%S")

# Add/update nav before syncing
./update-nav.sh

# Add all changes
echo "🔄 Committing changes..."
git add .
git commit -m "Sync: $NOW" || echo "⚠️ No changes to commit."

# Push to GitHub
echo "🚀 Pushing to GitHub..."
git push

# Done
echo "✅ Notes synced and updated at $(date +"%H:%M:%S")"
