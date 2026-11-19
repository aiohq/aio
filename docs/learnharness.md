# LearnHarness compared to the evidence-based teaching standard

This document compares the [LearnHarness](https://github.com/amosblomqvist/learnharness) flow with the standard that education research converges on: diagnosis, goal, plan, teaching in small steps with checks, guided practice, independent practice, and spaced review. The comparison comes from a read of the prober, teacher, and practice prompts (`src/agent/prompts/`) and of the flashcards plugin (`plugins/flashcards/`). Conclusion: LearnHarness covers diagnosis, teaching, and practice well, but the reasoning you learn gets no spaced review, a guided practice stage is missing, and a new lesson does not reactivate the previous one.

## The reference standard

The standard is not one official sequence, but research points to this order:

```text
probe, plan, teach (with a check at each step), guided practice, independent practice
afterwards: spaced review over days and weeks, with interleaved subjects
```

Retrieval from memory is not the last stage. It appears at the start of each lesson, inside teaching as the check, and later in spaced reviews.

## Stage-by-stage comparison

The table marks each stage as covered, partial, different, or missing:

| Standard stage                                                | LearnHarness                                                                                                                                                                                                                                                                   | Status                       |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------- |
| Diagnosis                                                     | The prober runs a binary search on each prerequisite: it starts with the hard question, goes down when you get it wrong, and stops when it finds where your knowledge ends. Before that, it reads the graph so it does not measure again what you already master.              | Covered, stricter than usual |
| Defined goal                                                  | The prober questions you until the goal is concrete. It does not design a final test from the goal, as _backward design_ requires. The end criterion is "the goal feels obvious to you", verified by the checks.                                                               | Partial                      |
| Plan                                                          | A minimal dependency map, which it rewrites when your answers contradict the diagnosis.                                                                                                                                                                                        | Covered                      |
| Teaching with a check at each step                            | Each step follows the cycle predict, teach, check. If you fail the check, it fixes the gap before it moves on. The prediction before the explanation is the _pretesting effect_, which has good evidence.                                                                      | Covered, strong              |
| Guided practice (worked example, with help removed over time) | This stage does not exist. A worked example appears only in passing in teach. In practice, help comes as a ladder of hints, from the vaguest to the most revealing, one per request. This is adaptive scaffolding, but it is not the classic "I do, we do" sequence.           | Different                    |
| Independent practice                                          | Separate sessions, with problems that do not say which concept to use. It interleaves subjects by default. It aims for about 85% accuracy per step. It redoes each mistake in a new form before it ends the session.                                                           | Covered, above the standard  |
| Interleaving                                                  | Inside the practice session, yes. Across sessions or subjects, I did not find it.                                                                                                                                                                                              | Partial                      |
| Review at the start of the lesson (Rosenshine)                | The teaching session skips what you already master instead of reviewing it. Only the practice session opens with 1 to 3 warm-up questions.                                                                                                                                     | Missing in teach             |
| Spaced review                                                 | The flashcards plugin, enabled by default, schedules reviews with FSRS-6 (the Anki algorithm) and aims for 90% retention. It covers only isolated facts, one proposition per card. The practice sessions, which train reasoning, have no schedule: you decide when to do them. | Partial, facts only          |
| Feedback                                                      | Immediate and honest, with an explicit rule to never soften a mistake.                                                                                                                                                                                                         | Covered                      |
| _Mastery learning_                                            | Inside the session, yes: it moves on only when the check passes. Across sessions, no: the graph does not store a mastery level, by design.                                                                                                                                     | Partial                      |

## Where it bets outside the consensus

The core of the teaching is a method by the author of LearnHarness. First come unconditional facts, which you accept without reservation. Then each step is derived as if you could have discovered it yourself, in the style of 3Blue1Brown. The goal is the "click", the moment when loose facts start to follow from a few foundations.

The method lines up with practices that have evidence: elaboration, self-explanation, and schema formation. As a package, however, it is the author's theory. The prompt states that "no other method comes close", and that is opinion, not a study result. I know of no empirical validation of the method as a whole.

## The gaps, in order of impact

Three gaps weigh the most:

1. **Reasoning has no spacing.** You learn a derivation today, and nothing pulls you back to practice it a week from now. Only isolated facts come back, through the flashcards.
2. **The bridge between teaching and practice is missing.** There is no worked example with the help removed over time, so the jump from "I understand" to "I can solve it alone" is large.
3. **A new lesson does not reactivate the previous one.** This matters in a long subject that spans several sessions.

## What this changes for aio

Porting teaching and practice to aio is direct, because both are only prompts. FSRS is code, so there are two ways out:

- **Export the cards to Anki**: you get a mature scheduler and the mobile app. In exchange, you review outside the agent.
- **A small script that writes the next review date for each item**: it also covers practice problems, not only facts, and closes gap 1. The scheduling is less sophisticated than FSRS.

I recommend the script, because it closes the gap that LearnHarness itself leaves open.
