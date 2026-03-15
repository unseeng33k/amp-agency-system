# AMP Agency System — Pipeline Reference Run
## Modern Mining Q1 Conviction Campaign
> This document traces the full pipeline from intake to creative output.
> It serves as both a worked example and a system test.
> Use it to verify the system produces coherent output end-to-end.

---

## How to Use This Document

Read it top to bottom. At each phase, you'll see:
- What triggered the phase
- What inputs were received
- What decisions were made and why
- What artifacts were produced
- What gate was passed to move forward

If a future run of this pipeline produces something that contradicts or
degrades from what's here — the system has a problem. If it builds on
and improves what's here — the system is working.

---

## PHASE 0 — Intake

**Trigger:** Michael says "I want to set up Modern Mining as a client and run a conviction campaign for their X account."

**Account Management Agent actions:**
1. Checks for existing client profile → not found
2. Flags: "New client — spawn Client Onboarding Agent first"
3. After onboarding complete → parses brief

**Brief extraction:**
```
OBJECTIVE:      Build conviction-first X/Twitter presence for Modern Mining
AUDIENCE:       Solo/small-operation Bitcoin miners, specifically those questioning whether to continue
PRODUCT:        Modern Mining (ASIC mining operation, Muscatine Iowa)
CONSTRAINT:     Zero paid budget. Organic-only. No links. No promotional content.
GAPS:           Primary account handle to confirm (@unseeng33k or @bslfmining)
```

**Decision:** 0 gaps blocking Research. Spawn Market Research Agent immediately.

**Artifacts produced:**
- `/projects/clients/modern-mining/client-profile.md`
- `/projects/clients/modern-mining/projects/proj-2026-001/project-state.md`

---

## PHASE 1 — Market Research

**Trigger:** AM Agent spawns Research Agent with brief + client profile.

**Pharma check:** Industry = Bitcoin mining. Not pharma. Pharma skill not invoked. Proceed with standard 6-domain research.

**Key domain findings:**

Domain 1 (Category): Bitcoin mining content is almost entirely economic — ROI, price targets, difficulty analysis. The conviction/identity frame is absent from the category.

Domain 2 (Customer): Post-halving community discourse uses survival metaphors and identity language. "Still here" is a repeated phrase. Miners who exited describe it as an identity decision, not a financial one.

Domain 3 (Culture): The broader culture treats small miners as irrational. The Bitcoin community treats long-term miners as respected veterans. These two cultural frames exist simultaneously.

Domain 4 (Competitive): Large mining operations (Marathon, Riot, CleanSpark) cannot credibly own the conviction/identity frame. They are economic actors by necessity. This territory is structurally available to a small conviction-run operator.

Domain 5 (Social): Reddit (r/BitcoinMining, r/Bitcoin) shows consistent "still here," "stayed the course" language. Community celebrates miners who survived previous cycles. Survival is social currency.

Domain 6 (Moment): Post-halving period. Hash rate compression visible. Competitor exits in the news. The cultural moment when the identity question is most live.

**Insight candidates surfaced:** 3 (see key-insights.md)

**Insight presented to Michael:**

```
RESEARCH COMPLETE: Modern Mining — Q1 Conviction Campaign

INSIGHT 1: Identity Over Economics
"Miners don't keep mining because the math works. They keep mining because
stopping would mean admitting they were wrong about who they are."

INSIGHT 2: The Silence Is the Signal
"When a miner goes quiet, the community notices. Presence is itself a form of proof."

INSIGHT 3: The Halving Is a Filter
"Every halving doesn't just cut block rewards. It cuts the field."

RECOMMENDATION: Insight 1 — it speaks to the wavering miner at the moment of
decision. Insights 2 and 3 are supporting territory to layer in over time.
```

**Michael selects:** Insight 1 — Identity Over Economics.

**Gate passed:** key-insights.md written, insight selected. Strategy Agent spawned.

---

## PHASE 2 — Strategy

**Trigger:** Research Agent hands off key-insights.md + selected insight to Strategy Agent.

**Step 0 — Prior strategy check:** New client. No strategy history. Proceed.

**Step 1 — Insight pressure test:**
| Question | Answer |
|----------|--------|
| Makes target feel seen, not studied? | YES — speaks to the internal question the miner is asking |
| Challenges category assumption? | YES — category assumes economic motivation; this inverts it |
| Points to specific tension? | YES — identity vs. permission to quit |
| Only this brand can own it? | YES — large miners cannot credibly own conviction frame |
| Creates emotional memory? | YES — "wrong about who they are" is a chest-feel statement |
| Passes the shower thought test? | YES — "miners don't keep mining because the math works" |

**Insight passes all 5 tests. Proceed.**

**Assumption audit:** 5 questions run (see assumption-audit.md)
Key finding: The economic frame is the enemy. The brief must not engage with it.
Key inversion: Don't make the case for mining. Speak from inside the decision already made.

**Behavioral diagnosis (behavior-architecture.md):**
- COM-B: Reflective Motivation (dominant). Target has consciously weighed stopping.
- Fogg: Quadrant 3 — High Ability, Low Motivation. Don't teach. Rebuild motivation.
- Fogg prompt: Spark (motivate + trigger simultaneously at moment of doubt)
- Cialdini: Unity (primary). Social Proof — peer-specific (secondary).
- Brief must: Lead with identity. Reframe the question. Never make the economic argument.

**Positioning:**
```
FOR:      Solo and small-operation Bitcoin miners who have already questioned stopping
WHO:      Carry the weight of a decision they've made but not yet named
MODERN MINING IS: The voice of miners who stayed
THAT:     Speaks from inside the conviction, not about it
BECAUSE:  Has stayed operational through multiple halvings and market cycles
UNLIKE:   Content that argues for mining — which confirms the miner's doubt is reasonable
```

**GOST:**
```
GOAL:      Establish Modern Mining as the voice of miners who stayed
OBJECTIVE: Build an engaged follower base of 500+ miners who identify with the brand
           within 90 days of launch
STRATEGY:  1. Own the conviction and identity territory (not economics/analysis)
           2. Make presence itself the message — consistency as content strategy
           3. Speak from inside the community, never above or outside it
TACTICS:   Weekly text-only X posts, conviction register
           Thread series — "They Left," "Still Running," others
           Community reply strategy (Type 3 — always drafted, never auto-posted)
```

**Creative brief written.** (see creative-brief.md)
**Media strategy:** X/Twitter organic only. 3-5x per week. Text-only. No links. 9-11pm ET posting window. No paid track.

**Gate 1 — Strategy:** Brief presented to Michael. "Looks good. Go."

---

## PHASE 2b — Channel Review (Campaign Management Agent)

**Trigger:** Strategy approval triggers Campaign Management Agent to run channel review.

**Inputs read:**
- `campaign-activation-plan.md` (Strategy's channel proposal)
- `audience-platform-intelligence.md` (Research's evidence)

**Channel: X/Twitter — validation:**
- Audience evidence: STRONG — r/BitcoinMining, community monitoring confirms miners
  active on X, text-first engagement, late-evening activity windows documented
- Current platform performance: Text-only posts with strong POV outperform images
  for conviction-register content. Links suppress reach. No hashtags needed.
- Format fit: CONFIRMED — conviction text posts ≤280 chars match what performs
- Cadence: ACHIEVABLE — 3-5x/week is realistic for solo operator with approval workflow
- Verdict: ✅ FULLY CONFIRMED

**Channels not proposed (from audience-platform-intelligence.md):**
- LinkedIn: Community is present but X is where identity-level conviction content lands.
  LinkedIn skews professional/analytical. Not wrong to skip for Phase 1.
- Reddit (r/BitcoinMining): High community activity but brand posting is awkward.
  Better as monitoring/research channel than content deployment.

**Summary verdict: FULLY CONFIRMED — proceed to Activation Checkpoint.**

**channel-review.md written.**

**Gate 2 — Activation:** AM Agent presents activation plan + channel review to Michael.
  Channel: X/Twitter confirmed. Asset list: 10 posts + 2 threads confirmed.
  Weekly commitment: ~1 hour review. Michael: "Go."

---

## PHASE 3 — Creative

**Trigger:** Strategy approval. Creative Agent receives creative-brief.md + behavior-architecture.md + media-strategy.md.

**Campaign mode detection:** No paid budget in media-strategy.md. Organic-only mode activated.

**Brief interrogation (6 questions run):**
Key finding from Question 3: "The real problem is not that miners are uninformed — it's that they've lost the identity argument to themselves."
Key finding from Question 6: "The uncomfortable version: the content that moves wavering miners is the content that doesn't try to move them."

**Category Default Language Audit:**
Default: Bullish/bearish takes, price commentary, technical analysis, "HODL" encouragement
Default tone: Either hype or defensiveness
Default story arc: Problem (hard market) → insight (long-term thesis) → call to action (stay in)
Category taboo: Saying you mine for identity reasons rather than financial ones. Weakness framing.

**Breaking the default:** Don't participate in the economic frame at all. State presence. No arc. No resolution. Just the fact of still running.

**What If? log (10 questions generated):**
- What if the content never acknowledged that mining is hard?
- What if every post was 3 sentences or fewer?
- What if the brand never asked anyone to do anything?
- What if "still running" was the only message the brand ever needed?
- What if the content felt like it was written by someone who had already decided, for people who already decided?
- What if absence (not posting) was also content?
- What if the brand's silence was louder than other miners' activity?
- What if the thread format was used to legitimize the other side before stating ours?
- What if every post ended on a distinction rather than a call?
- What if the voice sounded like a fact, not an argument?

**Most dangerous:** "What if the content never acknowledged that mining is hard?" + "What if every post ended on a distinction rather than a call?"

**Collision:** Content that doesn't acknowledge hardship but that ends on a distinction the reader resolves for themselves. The content isn't inspirational — it's a mirror.

**Concept: "Still Running"**
The brand as witness to its own persistence. Not testimony — presence. The content doesn't argue that mining is worth it. It observes that the rigs are running. The reader decides what that means.

**Voice tests:**
- Chest-feel test: PASS — "We couldn't stop" hits differently than "we chose to stay"
- Never-heard-before test: PASS — no mining brand speaks this way
- One-week memory test: PASS — "The rigs are running. Not because the math worked out. Because we couldn't stop." is memorable
- Wrong-room test: Would make a financial analyst uncomfortable. PASS.
- Annoy-the-client test: Michael would have to sit with "the rigs are running and that's the whole post." PASS.

**Output:**
- organic-post-01.md: 8 posts across 2 series (Still Running + Witness)
- thread-01.md: "They Left" — 5-tweet thread legitimizing exit before stating presence

**Gate:** Concepts presented to Michael. Awaiting approval.

---

## WHAT THE PIPELINE VERIFIED

Running this project through the full system revealed the following:

**Working correctly:**
1. Pharma detection gate: fired, found non-pharma, skipped skill, proceeded normally
2. Organic-only campaign mode detection: no paid budget → organic sequence activated
3. COM-B diagnosis: Reflective Motivation → brief argues rather than inspires
4. Fogg Quadrant 3 diagnosis: Spark prompt logic (content IS the motivation)
5. Cialdini Unity lever: content speaks from inside the experience, not about it
6. "Don't make the economic argument" rule held through every piece of copy
7. Category default audit: economic frame identified as the default to break
8. "Most dangerous What If?" process produced the thread concept
9. Channel review: Campaign Management Agent validated X/Twitter against audience
   evidence from audience-platform-intelligence.md. Verdict: FULLY CONFIRMED.
   LinkedIn and Reddit documented as options left on the table with rationale.
10. Four-checkpoint flow: Strategy → Activation → Creative → Launch gates all present

**What a future run would add:**
- Production phase: content calendar built, Google Calendar events created
- Analytics phase: KPI framework (engagement rate targets, traction signal thresholds)
- Campaign Management: organic launch sequence, 24h check, weekly monitoring
- Learning Log: updated after first 30 days with what actually resonated

---

## FILE MANIFEST

```
/projects/clients/modern-mining/
  client-profile.md

/projects/clients/modern-mining/projects/proj-2026-001/
  project-state.md

  research/
    key-insights.md

  strategy/
    assumption-audit.md
    behavior-architecture.md
    creative-brief.md
    [positioning.md — abbreviated in pipeline doc above]
    [media-strategy.md — organic-only, X/Twitter, documented in project-state]
    [gost.md — documented in pipeline doc above]

  creative/
    organic-post-01.md
    thread-01.md
    [what-if-log.md — abbreviated in pipeline doc above]
```
