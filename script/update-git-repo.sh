echo "[$(date '+%Y-%m-%d %H:%M:%S')](INFO) sh $0 $*" >&2

repos="$*"
for repo_path in $repos; do
  echo "cd $repo_path" >&2
  cd $repo_path
  echo "git fetch origin" >&2
  git fetch origin
  echo "git remote prune origin" >&2
  git remote prune origin
done
