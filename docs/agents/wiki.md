# Wiki

Each chief-of-staff goal keeps its wiki and its exploration notes in `.scratch/<goal>/`. The wiki is in git, and the notes stay out of it, because `.gitignore` lists `.scratch/*/notes/`. The user deletes the folder of a goal when the goal ends.

- **Path**: every agent reads and writes `.scratch/` through the main checkout, the parent of `git rev-parse --path-format=absolute --git-common-dir`. The `.scratch/` in a worktree is a copy from when its branch started, so it misses newer pages.
- **Wiki**: `.scratch/<goal>/wiki/`. The chief of staff is the only one who edits `index.md`, and a subagent adds new pages only, so two subagents in parallel never overwrite each other's `index.md`.
- **Commits**: the chief of staff commits `.scratch/` changes straight to `main` in the main checkout and pushes them, with no pull request. A commit that touches anything outside `.scratch/` takes the change flow in `AGENTS.md`.
- **Notes**: `.scratch/<goal>/notes/` holds the notes of exploration subagents.
- **Lasting rules**: a decision made for one goal stays in its wiki. A rule that must outlast the goal is one the user adds to `AGENTS.md` or `docs/`.
