#!/usr/bin/env bash
# exit on error
set -o errexit

current_branch=$(git rev-parse --abbrev-ref HEAD)
git checkout --orphan gh-pages
pnpm build
git --work-tree dist add --all
git --work-tree dist commit -m 'Deploy'
git push origin HEAD:gh-pages --force
rm -r dist
git checkout -f "$current_branch"
git branch -D gh-pages