# aio

aio is a one-on-one tutor that diagnoses what you already know and adjusts the teaching after each answer.

## Why a one-on-one tutor

One-on-one tutoring with _mastery learning_ is the most effective form of teaching known, well above a regular classroom. In mastery learning, you move on only when you master the current step. With a one-on-one tutor, the lesson plan changes all the time, because each answer you give shows where the tutor got the diagnosis wrong. aio tries to deliver that tutor through an AI agent.

## How a session works

Each subject follows this flow:

```text
probe → plan → teach (with a check at each step) → guided practice → independent practice
                                                                          ↓
                                        spaced review (days/weeks), interleaved
```

Each stage does this:

1. **probe**: measures what you already know and makes the goal concrete.
2. **plan**: builds the smallest map of prerequisites that leads to the goal.
3. **teach**: teaches in small steps and checks each step before it moves on.
4. **guided practice**: shows a worked example and removes the help a little at a time.
5. **independent practice**: gives problems that do not say which concept to use.
6. **spaced review**: brings the subject back on different days, at growing intervals.

Recall is not a stage at the end. It opens each lesson, appears inside teach as the check, and comes back later in the spaced reviews. The [methodology](docs/methodology.md) explains where each stage comes from.

## What aio keeps on the filesystem

aio reads and writes files straight to disk, so you can open everything in any editor. It stores:

- the teaching tone you prefer;
- the session history;
- the interactive lessons;
- the sources you choose, such as books and papers.

## Documentation

The documents in `docs/` cover the base of the project:

- [Methodology](docs/methodology.md): the evidence-based teaching principles and how they become the aio flow.
- [LearnHarness compared to the teaching standard](docs/learnharness.md): what aio takes from LearnHarness and which gaps it closes.

## References

These sources inspired the project:

- [LearnHarness](https://github.com/amosblomqvist/learnharness), the source of the probe, plan, teach, practice, and recall flow.
- [deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) (`dhs`).
- [A Programming Paradigm for Spatiotemporal Composability](https://arxiv.org/abs/2608.25512), also called _Everything is a Plugin_.
- [How I Learn Difficult Things](https://youtu.be/ciC6ffUqI8k), July 13, 2026.
- [How I Use AI to Learn Things](https://youtu.be/kzcI5F4tGiU), August 14, 2026.
- [Agent Harness for Learning Things](https://youtu.be/nfTDljFG2g0), October 23, 2026.
