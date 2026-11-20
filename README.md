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

Recall is not a stage at the end. It opens each lesson, appears inside teach as the check, and comes back later in the spaced reviews. The [methodology](docs/product/methodology.md) explains where each stage comes from.

## References

These sources inspired the project:

- [LearnHarness](https://github.com/amosblomqvist/learnharness), the source of the probe, plan, teach, practice, and recall flow.
- [How I Learn Difficult Things](https://youtu.be/ciC6ffUqI8k), July 13, 2026.
- [How I Use AI to Learn Things](https://youtu.be/kzcI5F4tGiU), August 14, 2026.
- [Agent Harness for Learning Things](https://youtu.be/nfTDljFG2g0), October 23, 2026.
