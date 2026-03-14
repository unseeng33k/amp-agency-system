# Agency Agent System — Overview

## Architecture

A full-service marketing agency workflow. Sequential where it must be sequential.
Parallel where it can be. The diagram below reflects the actual flow — not the ideal one.

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                              MICHAEL (Client)                                 │
│         New client / Brief in → Approvals → Go signals                        │
└──────────────────────────────────┬───────────────────────────────────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   CLIENT ONBOARDING         │  ← New client setup
                    │   Create folder structure   │    API connections
                    │   Platform access survey    │    client-profile.md
                    └──────────────┬──────────────┘
                                   │ onboarding complete
                                   │
                    ┌──────────────▼──────────────┐
                    │    ACCOUNT MANAGEMENT       │  ← Orchestrator
                    │    Check client-profile.md  │    Single point of contact
                    │    Create project-state.md  │    Owns all handoffs
                    └──────────────┬──────────────┘
                                   │ spawns immediately
           ┌───────────────────────┼──────────────────────┐
           │                       │                      │
           ▼                       ▼                      │
  ┌─────────────────┐   ┌──────────────────────┐         │
  │  PROJECT MGMT   │   │   MARKET RESEARCH    │         │
  │  (always on,    │   │   Domains 1-6        │         │
  │   background)   │   │   key-insights.md    │         │
  └────────┬────────┘   └──────────┬───────────┘         │
           │ monitors                │ passes insights     │
           │ all phases              ▼                     │
           │            ┌──────────────────────┐          │
           │            │     STRATEGY         │ ← ✅ CHECKPOINT
           │            │   creative-brief.md  │
           │            │   media-strategy.md  │
           │            └──────────┬───────────┘
           │                       │
           │           ┌───────────┴─────────────┐
           │           │ media-strategy.md forks  │
           │           ▼                          ▼
           │  ┌──────────────────┐    (held until creative
           │  │    CREATIVE      │     approval, then sent
           │  │  2 concepts min  │     to CAMPAIGN MANAGEMENT)
           │  │  per channel     │
           │  └────────┬─────────┘ ← ✅ CHECKPOINT
           │           │ approved concept
           │           │
           │    ┌──────┴──────────────────┐
           │    │  runs simultaneously    │
           │    ▼                         ▼
           │  ┌──────────────┐   ┌──────────────────┐
           │  │  PRODUCTION  │   │    ANALYTICS     │
           │  │  assets built│   │  UTMs + KPIs     │
           │  │  copy locked │   │  tracking-ready  │
           │  └──────┬───────┘   └────────┬─────────┘
           │         │                    │
           │         └────────┬───────────┘
           │                  │ both complete
           │                  ▼
           │       ┌──────────────────────┐
           │       │     CAMPAIGN MANAGEMENT       │ ← ✅ CHECKPOINT
           │       │  organic track       │
           │       │  paid track (if any) │
           │       │  launch-log.md       │
           │       └──────────┬───────────┘
           │                  │ post-launch data
           │                  ▼
           │       ┌──────────────────────┐
           └──────▶│  LEARNING LOG        │
                   │  client-profile.md   │
                   │  Section 8 updated   │
                   └──────────────────────┘
```

---

## Parallel Tracks

Two things run simultaneously and must not be confused with sequential phases:

**Project Management Agent** — always on from project creation to close.
Monitors all phases. Surfaces blockers. Tracks SLAs. Never produces creative work.

**Production + Analytics** — run simultaneously after creative approval.
Production builds assets. Analytics builds UTM/tracking. Neither waits for the other.
Campaign Management cannot start until both are complete.

**media-strategy.md fork** — produced by Strategy, consumed by two agents:
- Creative Agent reads it for channel constraints before concepting
- Campaign Management Agent receives it at launch for channel execution plan

---

## The Three Creative Levels (from your source material)

Every creative execution in this system must operate at three levels:

| Level | What it is | Who owns it |
|-------|-----------|-------------|
| **Insight** | The deep human truth. Verbatim. Untouchable. | Research Agent |
| **Idea** | A reaction. 2-4 words. What the target needs to feel/believe. | Creative Agent |
| **Big Idea** | Radical, singular, ownable. Never seen in this form before. | Creative Agent |

A concept that skips Level 2 (the Idea) goes straight to execution.
Execution without an Idea is decoration.

---

## The Four-Phase Engagement Cadence

Every campaign runs through four phases. The phases are sequential.
You cannot create before you learn. You cannot measure before you launch.

```
LEARN      Discover the insights where the brand can win.
           Domains: category, customer, culture, competitive, social, moment-in-time.
           Output: key-insights.md, competitive-content-audit.md
           Agent: Market Research

DEFINE     Determine what to communicate to create behavior change.
           Positioning, brief, behavioral architecture, GOST, persona profiles.
           Output: creative-brief.md, media-strategy.md
           Agent: Strategy

CREATE     Bring the strategy to life in a compelling, channel-constrained way.
           Channel-specific copy, visual direction, concept packages.
           Output: Concept files, production-package.md, UTM master sheet
           Agents: Creative → Production → Analytics (in parallel)

MEASURE    Optimize based on what the data shows — and feed learning forward.
           KPI tracking, performance signals, learning log update.
           Output: monitoring-log.md, launch-log.md, client-profile.md updated
           Agent: Campaign Management → Learning Log
```

**The cadence is circular, not linear.** MEASURE feeds back into LEARN for the next project.
Every campaign closes by making the next campaign smarter.

---

## Checkpoints

Three phases require **explicit Michael approval** before the pipeline advances:

| Checkpoint | What's approved | What triggers it |
|------------|----------------|-----------------|
| **Strategy** | creative-brief.md + media-strategy.md | Strategy Agent completes both |
| **Creative** | Winning concept package | Michael selects concept |
| **Campaign Management** | Final assets + launch plan | Production + Analytics both complete |

No agent advances past a checkpoint without a "Go" in the chat.
"Looks good" counts. Silence does not.

---

## Client Memory

Every client has a persistent profile that lives above all project folders:

```
/projects/clients/[client-slug]/client-profile.md
```

This file is read by every agent before starting any phase.
It contains: business context, audience knowledge, brand constraints,
platform access, what worked, what didn't, and a Learning Log updated
after every campaign closes.

**A project that starts without reading the client profile is starting cold.**

---

## Agent Sequence Reference

| Order | Agent | Purpose | Auto-start? | Checkpoint |
|-------|-------|---------|-------------|------------|
| 0 | Client Onboarding | New client setup, folder structure, API connections | On "new client" mention | — |
| 1 | Account Management | Intake, client profile check, orchestration | On brief receipt | — |
| ∥ | Project Management | Timeline + blockers, always running | On project create | — |
| 2 | Market Research | 6-domain research, insight excavation | After intake | — |
| 3 | Strategy | Brief + positioning + media strategy | After insight selected | **YES** |
| 4 | Creative | 2+ concepts, channel-constrained | After strategy approval | **YES** |
| 5a | Production | Assets built, copy hard-locked | After creative approval | Optional |
| 5b | Analytics | UTMs + KPI framework | After creative approval | — |
| 6 | Campaign Management | Launch — organic + paid tracks | After 5a + 5b complete | **YES** |
| — | Learning Log | Client profile updated | After deployment | — |

---

## Project State File

```yaml
project_id:         proj-2026-001
project_name:       Modern Mining — Q1 Conviction Campaign
client_slug:        modern-mining
client_profile:     /projects/clients/modern-mining/client-profile.md
current_phase:      strategy
completed_phases:   [intake, market-research]
next_phase:         creative
brief_summary:      Build conviction-first organic X presence for ASIC mining company in Muscatine IA
target_audience:    Solo and small-operation Bitcoin miners questioning whether to keep going
key_decisions:
  - Insight selected: Identity over economics
  - Primary channel: X/Twitter organic, text-only, no links
  - Media strategy: organic track only, no paid budget defined
constraints:
  budget:     unknown
  timeline:   ongoing content cadence
  brand:      no guidelines on file yet
artifacts:
  - /projects/proj-2026-001/research/key-insights.md
  - /projects/proj-2026-001/research/competitive-content-audit.md
  - /projects/proj-2026-001/strategy/creative-brief.md
  - /projects/proj-2026-001/strategy/media-strategy.md
open_questions:
  - Client budget for paid media unknown
  - Brand guidelines not yet provided
status: awaiting-approval
last_updated_by: Account Management Agent
last_updated_at: 2026-03-14
```

---

## Files in This Folder

| File | Location | Purpose |
|------|----------|---------|
| `SYSTEM-PROMPT.md` | `agents/` | Shared DNA — prepended to all agents. **Set paths here first.** |
| `SKILL-DISCOVERY-PROTOCOL.md` | `agents/` | Skill locations, API key template, install commands |
| `REVISION-PROTOCOL.md` | `agents/` | How to classify, route, and log revisions |
| `CLIENT-PROFILE-TEMPLATE.md` | `templates/` | Template for per-client persistent memory |
| `01-Client-Onboarding-Agent.md` | `agents/` | New client setup — folder structure, API connections, platform survey |
| `02-Account-Management-Agent.md` | `agents/` | Orchestrator — intake, handoffs, checkpoints |
| `03-Market-Research-Agent.md` | `agents/` | 6-domain research, insight excavation, content audit |
| `04-Strategy-Agent.md` | `agents/` | Brief + positioning + media strategy (paid/organic split) |
| `05-Creative-Agent.md` | `agents/` | Concept development — What If? ideation, channel-constrained |
| `06-Production-Agent.md` | `agents/` | Asset production — copy hard-locked, QA at build time |
| `07-Analytics-Agent.md` | `agents/` | UTM architecture, KPI framework, platform tracking |
| `08-Campaign-Management-Agent.md` | `agents/` | Launch execution — organic + paid tracks, learning log trigger |
| `09-Project-Management-Agent.md` | `agents/` | Timeline, blockers, SLA monitoring — always on |
| `api-keys.md` | `resources/` | **Your keys — never committed. See SKILL-DISCOVERY-PROTOCOL.** |
| `00-Overview.md` | `agents/` | This file |
