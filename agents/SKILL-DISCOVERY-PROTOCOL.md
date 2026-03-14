# SKILL DISCOVERY PROTOCOL — AMP Agency Agent System

> This document governs how every agent in the system finds, loads, and applies
> skills before starting work. Read this file at the start of every task.

---

## PATH SETUP

Before using this file, confirm your paths from SYSTEM-PROMPT.md:

```
SKILLS_PATH:    [VAULT_ROOT]/resources/skills
                (or your existing local skills folder)

API_KEYS_PATH:  [VAULT_ROOT]/resources/api-keys.md
                (create this file locally — NEVER commit to git)
```

---

## Core Rule

**Before starting any phase, check if a skill exists that makes you faster or better.**
Don't improvise what a skill already defines.
Don't build from scratch what a skill already provides.

---

## Skill Locations

### Local Skills (always check first)
```
[SKILLS_PATH]/
```

| Skill | Path | Use When |
|-------|------|----------|
| `my-writing-style` | `[SKILLS_PATH]/my-writing-style/SKILL.md` | Writing ANY output — emails, docs, copy, posts |
| `copywriting` | `[SKILLS_PATH]/copywriting/SKILL.md` | Marketing copy, landing pages, CTAs, headlines |
| `agent-browser` | `[SKILLS_PATH]/agent-browser/SKILL.md` | Browser automation — forms, posting, scraping, QA |
| `playwright-dev` | `[SKILLS_PATH]/playwright-dev/SKILL.md` | Playwright-specific browser automation scripting |
| `agentmail` | `[SKILLS_PATH]/agentmail/SKILL.md` | Sending/receiving email programmatically |
| `find-skills` | `[SKILLS_PATH]/find-skills/SKILL.md` | Searching for skills that don't exist locally |
| `pharma-marketing` | `[SKILLS_PATH]/pharma-marketing/SKILL.md` | Pharma/healthcare-specific marketing context |
| `pptx` | `[SKILLS_PATH]/pptx/SKILL.md` | Creating PowerPoint presentations |
| `seo-audit` | `[SKILLS_PATH]/seo-audit/SKILL.md` | SEO analysis and optimization |

**Add your own skills here as you build them out.**

---

## Remote Skills — Install on Demand

Browse: https://skills.sh — 318+ skills available.
Install any skill: `npx skills add <owner/repo@skill> -g -y`

### Key GitHub Repos

| Repo | Best For |
|------|----------|
| `ComposioHQ/awesome-claude-skills` | Social media automation — LinkedIn, Instagram, Twitter, TikTok, Reddit, YouTube |
| `alirezarezvani/claude-skills` | 169 skills — 42 marketing, advisory, regulatory |
| `jimliu/baoyu-skills` | Social posting via real browser — X, anti-bot resistant |
| `obra/superpowers` | Reasoning, planning, parallel agents, debugging, writing |
| `github/awesome-copilot` | Playwright automation, Git workflows, PR reviews |


---

## Pre-Mapped Skills by Agent

### Market Research Agent
| Skill | Install | Use For |
|-------|---------|---------|
| `marketing-psychology` | `npx skills add coreyhaines31/marketingskills@marketing-psychology -g -y` | Behavioral insight frameworks |
| `competitor-alternatives` | `npx skills add coreyhaines31/marketingskills@competitor-alternatives -g -y` | Competitive gap analysis |
| `content-strategy` | `npx skills add coreyhaines31/marketingskills@content-strategy -g -y` | Content opportunity mapping |
| `competitive-ads-extractor` | `npx skills add composiohq/awesome-claude-skills@competitive-ads-extractor -g -y` | Scrape Facebook Ad Library + LinkedIn ads |

### Strategy Agent
| Skill | Install | Use For |
|-------|---------|---------|
| `marketing-psychology` | `npx skills add coreyhaines31/marketingskills@marketing-psychology -g -y` | Cialdini/behavioral framework depth |
| `product-marketing-context` | `npx skills add coreyhaines31/marketingskills@product-marketing-context -g -y` | Brand context before brief writing |
| `marketing-ideas` | `npx skills add coreyhaines31/marketingskills@marketing-ideas -g -y` | Lateral ideation before SMP is locked |

### Creative Agent
| Skill | Install | Use For |
|-------|---------|---------|
| `ad-creative` | `npx skills add coreyhaines31/marketingskills@ad-creative -g -y` | Ad format best practices |
| `brainstorming` | `npx skills add obra/superpowers@brainstorming -g -y` | Structured concept generation |
| `writing-skills` | `npx skills add obra/superpowers@writing-skills -g -y` | Advanced writing craft |
| `cold-email` | `npx skills add coreyhaines31/marketingskills@cold-email -g -y` | Email copy frameworks |
| `page-cro` | `npx skills add coreyhaines31/marketingskills@page-cro -g -y` | Conversion-focused copy |

### Production Agent
| Skill | Install | Use For |
|-------|---------|---------|
| `frontend-design` | `npx skills add anthropics/skills@frontend-design -g -y` | HTML/CSS production |
| `docx` | `npx skills add anthropics/skills@docx -g -y` | Word document production |
| `xlsx` | `npx skills add anthropics/skills@xlsx -g -y` | Spreadsheet production |

### Analytics Agent
| Skill | Install | Use For |
|-------|---------|---------|
| `analytics-tracking` | `npx skills add coreyhaines31/marketingskills@analytics-tracking -g -y` | Tracking best practices |
| `programmatic-seo` | `npx skills add coreyhaines31/marketingskills@programmatic-seo -g -y` | SEO measurement |

### Campaign Management Agent — Social Media
| Skill | Install | What It Does |
|-------|---------|-------------|
| `connect` | `npx skills add composiohq/awesome-claude-skills@connect -g -y` | 1,000+ platform integrations via OAuth |
| `linkedin-automation` | `npx skills add composiohq/awesome-claude-skills@linkedin-automation -g -y` | LinkedIn posts, company pages |
| `twitter-automation` | `npx skills add composiohq/awesome-claude-skills@twitter-automation -g -y` | Tweet posting, scheduling |
| `instagram-automation` | `npx skills add composiohq/awesome-claude-skills@instagram-automation -g -y` | Posts, stories, carousels |
| `baoyu-post-to-x` | `npx skills add https://github.com/jimliu/baoyu-skills --skill baoyu-post-to-x` | X via real Chrome — bypasses anti-bot |
| `launch-strategy` | `npx skills add coreyhaines31/marketingskills@launch-strategy -g -y` | Launch sequencing |

### All Agents — Execution
| Skill | Install | Use For |
|-------|---------|---------|
| `dispatching-parallel-agents` | `npx skills add obra/superpowers@dispatching-parallel-agents -g -y` | Parallel task orchestration |
| `verification-before-completion` | `npx skills add obra/superpowers@verification-before-completion -g -y` | QA before handoff |
| `systematic-debugging` | `npx skills add obra/superpowers@systematic-debugging -g -y` | When something breaks |


---

## API Keys

Store your keys at: `[API_KEYS_PATH]` (default: `[VAULT_ROOT]/resources/api-keys.md`)

**This file is listed in .gitignore. Never commit it.**

Create your api-keys.md using `resources/api-keys-template.md` as the base.
Fill in whatever keys you have — skip any you don't. Agents will flag missing integrations.

| Service | Use | Agent | API Access |
|---------|-----|-------|-----------|
| Moonshot/Kimi | Primary LLM — long-context research, deep analysis | Research | ✅ Paid API |
| Anthropic/Claude | Strategy, creative, structured output | All | ✅ API key |
| OpenAI | DALL-E image gen, GPT-Image, fallback LLM | Production | ✅ API key |
| OpenRouter | Multi-model routing and fallback chain | All | ✅ API key |
| xAI/Grok | Real-time web data, current events | Research | ✅ API key |
| Gemini | Web interface only — no API access | — | ⚠️ Account only |
| ChatGPT | Web interface only — no API access | — | ⚠️ Account only |
| Brave Search | Web search | Research |
| Google Places | Location data | Research |
| Google Analytics | Campaign reporting | Analytics |
| Google Cloud OAuth | Google services auth | Various |
| X Consumer Key/Secret | Twitter API posting | Campaign Mgmt |
| X Bearer Token | Twitter API read | Campaign Mgmt |
| X Access Token/Secret | Twitter API write | Campaign Mgmt |
| X Client ID/Secret | OAuth 2.0 flow | Campaign Mgmt |
| LinkedIn API | Posts, comments, replies, reactions (direct) | Campaign Mgmt |
| Composio | Instagram, TikTok, Reddit, fallback | Campaign Mgmt |
| AgentMail | Programmatic email | Campaign Mgmt |
| BlueBubbles | iMessage alerts — Mac only, optional | Campaign Mgmt |
| Slack webhook | Push alerts — any platform, optional | Campaign Mgmt |
| Adobe PDF Services | PDF generation, Acrobat API | Production |
| Canva | MCP — OAuth, no key needed | Production |
| Microsoft Office | MCP — local install, no key needed | Production |

**Security rule:** Read keys from `[API_KEYS_PATH]` at runtime. Values are never embedded in agent files. Never displayed in output.

---

## Composio Setup (one time — OAuth persists after)

```bash
pip install composio
export COMPOSIO_API_KEY="[your-key-from-api-keys.md]"

# Authenticate each platform once
composio add linkedin
composio add instagram
composio add twitter

# Install master skill
npx skills add composiohq/awesome-claude-skills@connect -g -y
```

---

## Twitter/X — Two Posting Paths

**Path A — API direct (recommended):**
Read Consumer Key, Bearer Token from `[API_KEYS_PATH]` at runtime, then post via `api.twitter.com/2/tweets`.

**Path B — Browser fallback (if API rate limited):**
```bash
npx skills add https://github.com/jimliu/baoyu-skills --skill baoyu-post-to-x
```

---

## How to Load a Skill

1. Check `[SKILLS_PATH]/[skill-name]/SKILL.md` — if exists, read it
2. Search: `npx skills find [query]` or browse https://skills.sh
3. Install: `npx skills add <owner/repo@skill> -g -y`
4. Skill lands at: `~/.claude/skills/<skill-name>/SKILL.md` — read immediately
5. If not found: log gap in project-state.md, proceed with general capabilities

---

## Mandatory Reads — Every Agent, Every Task

```
1. [VAULT_ROOT]/agents/SYSTEM-PROMPT.md
2. [VAULT_ROOT]/agents/SKILL-DISCOVERY-PROTOCOL.md  (this file)
3. [PROJECTS_ROOT]/clients/[client-slug]/client-profile.md  (if returning client)
4. project-state.md for current project
```

Then load agent-specific skills before starting work.

---

## Writing Style Rule (Universal)

Every agent that produces written output must load and apply:
```
[SKILLS_PATH]/my-writing-style/SKILL.md
```

Key enforced rules: no em dashes, no "leverage/utilize/seamless/innovative/robust",
no hedge words unless uncertainty is real, active voice, specific over vague.

---

## Version

Skill Discovery Protocol Version: `1.1`
Last Updated: 2026-03
Portable: YES — replace [VAULT_ROOT], [PROJECTS_ROOT], [SKILLS_PATH], [API_KEYS_PATH]
