#!/bin/bash

set -e  # Exit on any error

echo "======================"
echo "Starting Podcast Generator"

# Configure git
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run the Python script
echo "Running feeding.py..."
python3 /usr/bin/feeding.py

# Git operations
echo "Committing changes..."
git add -A

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "No changes to commit"
else
    git commit -m "update Feed"
    echo "Pushing changes..."
    git push --set-upstream origin main
fi

echo "======================"
echo "Action completed successfully"

# Add to entrypoint.sh
echo "Current directory: $(pwd)"
echo "Git status:"
git status