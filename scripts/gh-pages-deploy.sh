#!/usr/bin/env bash
# exit on error
set -o errexit

git checkout --orphan gh-pages
pnpm build
git --work-tree dist add --all
git --work-tree dist commit -m 'Deploy'
git push origin HEAD:gh-pages --force
rm -r dist
git checkout -f main
git branch -D gh-pages