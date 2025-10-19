#!/bin/bash
# git-branch-cleaner.sh
# Deletes local Git branches that no longer exist on remote

echo "Fetching latest changes from remote..."
git fetch -p

echo "Listing stale local branches..."
stale_branches=$(git branch -vv | grep ': gone]' | awk '{print $1}')

if [ -z "$stale_branches" ]; then
    echo "No stale branches found."
else
    echo "Deleting stale branches..."
    for branch in $stale_branches; do
        git branch -D $branch
        echo "Deleted $branch"
    done
fi

echo "Done!"
