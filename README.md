Fancy CV
```
# compile
bash run.sh

# sync general changes
for BRANCH in $(ls .git/refs/heads);
    do git checkout $BRANCH;
    git merge master $BRANCH;
done;
git checkout master;
```
