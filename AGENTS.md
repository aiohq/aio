## Language

Write everything in English: code, comments, docs, commits, issues, pull requests, and domain terms.

## Comments and docs

Answer your questions from the source code, and add docs only for what no line of code can say. Agents read docs and code alike as text, so time spent maintaining docs is wasted.

Write a comment, docstring or new Markdown file only when no code search answers the question. Keep a comment or docstring to one line, and put a longer why in an ADR.

## Change flow

Every request that changes a tracked file, whatever its kind, ends in an open pull request to `main`. The exception is `.scratch/`, which the chief of staff commits straight to `main`, as `docs/agents/wiki.md` says. Run these steps without asking:

1. Create a worktree with `scripts/worktree.sh add <branch> <base>`, because parallel sessions share the main checkout. The script starts `<branch>` from `origin/<base>`, so push the local commits of `<base>` first. Under `implement-spec`, the integration branch starts from `main`, each implementer subagent creates its worktree with the integration branch as `<base>`, and you push the integration branch before each dispatch.
2. Make the change.
3. Push the branch and open the pull request to `main`. Its body lists `Closes #N` for each issue it resolves, so the merge closes them.

Remove a worktree with `scripts/worktree.sh remove <branch>`.

## Commits

Write every commit subject as a Conventional Commit. Issue numbers go in the pull request body, as step 3 of "Change flow" says.

## Agent skills

### Issue tracker

GitHub issues in `aiohq/aio`, through the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

The five default labels. See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: `GLOSSARY.md` and `docs/adr/`. See `docs/agents/domain.md`.

### Wiki

Before you read or write `.scratch/`, where each chief-of-staff goal keeps its wiki and notes, read `docs/agents/wiki.md`.
