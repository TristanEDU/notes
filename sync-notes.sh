#!/bin/zsh

cd ~/notes || exit

git add .
git commit -m "Sync: $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null
git push
