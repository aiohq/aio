# Domain docs

This repo has one context, with `GLOSSARY.md` and `docs/adr/` at the root.

## Read these before you explore

- `GLOSSARY.md`, for the term that names each concept.
- The ADRs in `docs/adr/` that touch the area you work in.

When a file is missing, continue without it. `/domain-modeling` creates `GLOSSARY.md` when the first term is resolved, and a new ADR when a decision needs one.

## Use the glossary's vocabulary

When your output names a domain concept (an issue title, a refactor proposal, a hypothesis, or a test name), use the term `GLOSSARY.md` defines, and leave out the synonyms its `_Avoid_` lines list. A concept missing from the glossary means that you invented a word the project doesn't use, or that the glossary has a gap to raise with `/domain-modeling`.

## Flag ADR conflicts

When your output contradicts an ADR, say so and give the reason to reopen it: "Contradicts ADR 0001 (Electron), but worth reopening because..."
