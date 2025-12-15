#!/bin/bash

echo "======================"

git config --global user.name "${GITHUB_ACTION}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace
 
python3 /usr/bin/feeding.py

git add -A && git commit -m "update Feed"
git push --set-upstream origin main

echo "======================"