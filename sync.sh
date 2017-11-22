#!/bin/bash
while getopts ":b:" opt; do
  case $OPTARG in
    b) build=true;;
    \?) echo "Invalid option: -$OPTARG ($opt)" >&2;;
  esac
done
branch=`git rev-parse --abbrev-ref HEAD`
branches=`ls .git/refs/heads`;
for BRANCH in $branches; do
    git checkout $BRANCH;
    git merge master $BRANCH -m "merge";
done;
if [ "$build" = true ]; then
    for BRANCH in $branches; do
        git checkout $BRANCH;
        bash run.sh;
    done;
fi
git checkout $branch;
