#!/bin/bash

# get -p switch
while getopts ":b:" opt; do
  case $OPTARG in
    b) build=true;;
    \?) echo "Invalid option: -$OPTARG ($opt)" >&2;;
  esac
done

# test branch switch
git checkout .
if [ $? -ne 0 ]; then
    echo "couldn't switch branch!"
    exit 1
fi

branches=`ls .git/refs/heads`;

# merge changes
for BRANCH in $branches; do
    if [ $BRANCH -ne "master" ]; then
        git checkout $BRANCH;
        git merge --squash master $BRANCH -m "merge";
        git reset --mixed origin/master
        git commit -am "$BRANCH";
        if [ $? -ne 0 ]; then
            echo "couldn't merge!"
            exit 1
        fi
    fi
done;

# if -p rebuild all
if [ "$build" = true ]; then
    for BRANCH in $branches; do
        git checkout $BRANCH;
        bash run.sh;
    done;
fi

# return
git checkout master;
