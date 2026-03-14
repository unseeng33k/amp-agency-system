# REVISION PROTOCOL — AMP Agency Agent System

> This document governs what happens when Michael rejects or requests changes to work
> at any checkpoint in the pipeline. Every agent must read and follow this protocol.
> It is part of the system context alongside SYSTEM-PROMPT.md.

---

## The Core Principle

A revision is not a failure. It is information.

When Michael rejects work, that rejection contains signal — about what was missed, what was assumed incorrectly, or what the brief failed to capture. The job of the revision protocol is to extract that signal cleanly and route it to exactly the right place in the pipeline, no further back than necessary.

**The most expensive mistake in revision: going back too far.**

If the creative concept is wrong because the strategy was wrong, fix the strategy.
If the copy is wrong because the brief was wrong, fix the brief.
If the headline is wrong because the writer misread the approved brief — fix the headline.

Do not rebuild the house because a window is cracked.

---

## Revision Triggers

A revision is triggered when Michael:

1. Explicitly rejects work at a checkpoint ("This isn't right," "Start over," "I don't like this")
2. Provides feedback that modifies approved direction ("Actually, let's shift the tone," "The audience is different than we thought")
3. Requests changes to already-approved work in a later phase (downstream revision)
4. Identifies a factual error, missing requirement, or misaligned deliverable

---

## Step 1 — Classify the Revision

Before doing anything, classify the feedback into one of four types:

| Type | Definition | Example |
|------|-----------|---------|
| **A — Surface** | Output is wrong. Direction is right. Fix the execution. | "The headline doesn't land. Try again." |
| **B — Directional** | Output followed the brief. The brief is wrong. Fix the brief. | "The tone is too clinical. We need warmth." |
| **C — Strategic** | The strategy itself needs to change. | "We're targeting the wrong audience." |
| **D — Scope** | New requirement not in original brief. | "We also need a version for LinkedIn now." |

**Why this matters:** Type A stays in the current phase. Type B goes back one phase. Type C may go back two or three phases. Type D is a new brief, not a revision.


---

## Step 2 — Route the Revision

Based on classification, route to the correct agent:

```
Type A — Surface Fix
  └─ Stay in current phase agent
  └─ No upstream impact
  └─ Produce revised deliverable
  └─ Return to checkpoint

Type B — Directional Fix
  └─ Return to the phase that produced the brief/direction
  └─ Revise the source document
  └─ Re-run the downstream phase with updated inputs
  └─ Return to checkpoint

Type C — Strategic Fix
  └─ Account Management Agent assesses how far back to go
  └─ Strategy Agent revises positioning/brief
  └─ All downstream phases re-run from that point
  └─ Full checkpoint sequence resumes

Type D — Scope Addition
  └─ Account Management Agent creates a new project branch
  └─ New brief generated
  └─ Pipeline starts fresh for the new scope item
  └─ Original project continues in parallel (not interrupted)
```

---

## Step 3 — Log the Revision

Every revision must be logged in `revision-log.md` before work begins.

### Revision Log Template

```markdown
## [Project Name] — Revision Log

| Rev ID | Date | Phase | Type | Feedback Summary | Root Cause | Resolution | Status |
|--------|------|-------|------|-----------------|------------|------------|--------|
| R-001 | YYYY-MM-DD | Creative | A | Headline too generic | Execution miss | Rewrite 3 headline options | ✅ Resolved |
| R-002 | YYYY-MM-DD | Strategy | C | Wrong target audience | Brief assumption | Revisit persona + rerun strategy | 🔄 In Progress |
```

The revision log is never deleted. It is a permanent project record.

---

## Step 4 — Communicate the Plan to Michael

Before beginning revision work, the Account Management Agent must confirm the plan with Michael in plain language:

**Template:**
```
Revision received. Here's how we're handling it:

Type: [A/B/C/D] — [plain language explanation]
Going back to: [phase name]
Estimated impact: [what will change, what will NOT change]
Timeline delta: [how much time this adds]

Shall I proceed?
```

Do not begin revision work until Michael confirms. Do not ask more than one clarifying question before confirming.


---

## Step 5 — Execute the Revision

### Rules for Revision Execution

**Preserve what was approved.**
If Strategy was approved and Creative is being revised, the Strategy docs are locked.
Do not re-open approved phases unless the revision explicitly requires it (Type C).

**Version, never overwrite.**
All revised artifacts use the versioning convention:
```
concept-01-big-idea-v2.md
brand-strategy-v2.md
```
The original approved version is never deleted. The revision log references both.

**Minimum viable re-run.**
Only re-run phases that are directly affected by the root cause.
If the creative brief changes one message pillar, re-run creative.
Do not re-run market research because a headline was wrong.

**Update project-state.md.**
When a revision is in progress, update status to `revision-in-progress`.
When resolved, update to `awaiting-approval` and return to checkpoint.

---

## Step 6 — Return to Checkpoint

After revision work is complete:

1. The revised deliverable is presented at the same checkpoint as before
2. The revision log entry is updated to "Resolved"
3. project-state.md is updated to `awaiting-approval`
4. Account Management Agent presents the revision with a clear diff summary:

**Template:**
```
Revision complete. Here's what changed:

What we changed: [specific changes made]
What we kept: [what was preserved from original]
Why: [root cause addressed]

Ready for your review.
```

---

## Revision Limits & Escalation

### Round Limits by Type

| Type | Max Rounds Before Escalation |
|------|------------------------------|
| A — Surface | 3 rounds |
| B — Directional | 2 rounds |
| C — Strategic | 1 round |
| D — Scope | N/A (new brief) |

**Escalation trigger:** If a revision cycles past its round limit without resolution, the Account Management Agent escalates to a structured alignment session with Michael — not more creative rounds. At this point the problem is not execution, it is brief clarity.

### The Alignment Session Protocol

When escalation is triggered:

1. AM Agent surfaces the full revision history for that phase
2. AM Agent asks Michael three questions only:
   - "What does success look like for this deliverable?"
   - "What specifically is not working in what we've shown you?"
   - "Is there a reference — internal or external — that captures the direction you want?"
3. Answers are used to rewrite the brief from scratch
4. New brief is approved before any creative re-runs

---

## Downstream Revision Handling

A downstream revision is when Michael requests changes to work that was already approved in a prior phase.

**Example:** Creative is approved and in Production. Michael now wants to change the campaign headline.

### Rules:
- Production halts immediately on affected assets
- AM Agent classifies the downstream revision (A/B/C/D)
- If Type A: Creative Agent makes the fix, Production resumes with updated spec
- If Type B or C: All work downstream of the change point is paused pending strategy/brief resolution
- PM Agent updates the timeline and logs the impact
- Michael is informed of the timeline delta before work resumes

**The hard truth about downstream revisions:**
Late-stage changes are expensive — not just in time, but in coherence. The SYSTEM-PROMPT checkpoint protocol exists precisely to catch misalignment early. If downstream revisions are recurring, the intake and brief process needs to be tightened, not the revision protocol.

---

## What Revision Is NOT

| This is NOT a revision | This IS a revision |
|------------------------|-------------------|
| "Can you add a whole new channel?" | "The Facebook copy needs a different CTA" |
| "We want to change the product" | "The product description is inaccurate" |
| "Let's start the whole project over" | "The strategy needs to target a different audience" |
| "Build us a second campaign" | "This concept isn't right — try a different angle" |

Anything in the left column is a new project brief routed through Account Management, not a revision.

---

## Files Produced by This Protocol

| File | Owner | When Created |
|------|-------|-------------|
| `revision-log.md` | AM Agent | First revision on any project |
| `[artifact]-v[n].md` | Phase Agent | Every revised deliverable |
| Updated `project-state.md` | Phase Agent | After every revision |

---

## Version

Revision Protocol Version: `1.0`
Last Updated: 2026-03
Applies To: All agents in `/Agency Agents/`
