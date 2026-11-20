#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "usage: scripts/worktree.sh add <branch> <base> | remove <branch>" >&2
  exit 2
}

# Worktrees live in the main checkout, also when this runs inside another worktree.
main_checkout=$(dirname "$(git -C "$(dirname "$0")" rev-parse --path-format=absolute --git-common-dir)")
cd "$main_checkout"

case "${1:-}" in
  add)
    [ $# -eq 3 ] || usage
    branch=$2
    base=$3
    path=$main_checkout/worktrees/${branch//\//-}
    git fetch -q origin "+refs/heads/$base:refs/remotes/origin/$base"
    # --no-track leaves the branch without an upstream, so a bare `git push` cannot reach $base.
    git worktree add -q --no-track -b "$branch" "$path" "refs/remotes/origin/$base"
    (cd "$path" && npm ci --silent)
    echo "$path"
    ;;
  remove)
    [ $# -eq 2 ] || usage
    path=$(git worktree list --porcelain | awk -v b="branch refs/heads/$2" '/^worktree /{wt=substr($0, 10)} $0 == b{print wt}')
    if [ -z "$path" ]; then
      echo "no worktree has the branch $2" >&2
      exit 1
    fi
    git worktree remove "$path"
    echo "removed $path"
    ;;
  *) usage ;;
esac
