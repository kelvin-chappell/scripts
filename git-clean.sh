# Pull latest default branch and clean up after a squash merge.
#
# See https://medium.com/opendoor-labs/cleaning-up-branches-with-githubs-squash-merge-43138cc7585e
# and https://stackoverflow.com/questions/28666357/git-how-to-get-default-branch
# and https://stackoverflow.com/questions/48341920/git-branch-command-behaves-like-less

MAIN=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

git checkout $MAIN \
&& git pull \
&& git remote prune origin | grep kc- | sed 's/^.*origin\///g' | xargs -L1 -J % git branch -D %

echo
echo "===== Branches ====="
git branch
echo 

echo "===== Stashes ====="
git stash list
echo

