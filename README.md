# AMP Agency Agent System

A full-service AI marketing agency workflow built on plain markdown.
Run it with Claude, GPT-4o, Gemini, or any AI that can read files.

---

## What This Is

Eight specialized agents — Research, Strategy, Creative, Production, Analytics,
Deployment, Account Management, Project Management — that run a complete marketing
campaign pipeline from brief to launch. Each agent has a defined role, defined inputs,
defined outputs, and defined handoffs.

The system is built on real agency methodology: the insight pyramid, What If? ideation,
COM-B behavioral architecture, GOST planning, media strategy split by paid/organic track,
and a learning log that feeds every campaign back into the next one.

---

## Folder Structure

```
AMP-Agency-System/
  agents/               ← All agent files + shared protocols
  templates/            ← Reusable templates (client profile, etc.)
  projects/
    clients/            ← One folder per client, persistent across campaigns
      [client-slug]/
        client-profile.md
        strategy-history/
    [project-id]/       ← One folder per campaign
      research/
      strategy/
      creative/
      production/
  resources/
    skills/             ← Local skill files (optional)
    api-keys.md         ← YOUR KEYS — never committed (see .gitignore)
```

---

## Quick Start

### Step 1 — Configure your paths

Open `agents/SYSTEM-PROMPT.md` and set the three path variables at the top:

```
VAULT_ROOT:    /path/to/AMP-Agency-System
PROJECTS_ROOT: /path/to/AMP-Agency-System/projects
SKILLS_PATH:   /path/to/AMP-Agency-System/resources/skills
```

### Step 2 — Create your api-keys.md

Copy the template from `agents/SKILL-DISCOVERY-PROTOCOL.md` into:
```
resources/api-keys.md
```
Fill in the keys you have. Skip the ones you don't — agents will flag missing integrations.

### Step 3 — Load SYSTEM-PROMPT into your AI

At the start of every session, tell your AI:
> "Read the file at [VAULT_ROOT]/agents/SYSTEM-PROMPT.md before we begin."

Or paste SYSTEM-PROMPT.md content directly into your system prompt field.

### Step 4 — Start a project

Tell the Account Management Agent:
> "I need to run a campaign for [client] to [objective]."

The pipeline starts automatically.

---

## Using With Different AIs

**Claude (claude.ai or API):** Paste SYSTEM-PROMPT.md into system prompt. Load agent files via file upload or Desktop Commander.

**GPT-4o / ChatGPT:** Upload SYSTEM-PROMPT.md and the relevant agent file at session start. Instruct: "Follow the instructions in these files exactly."

**Cursor / Claude Code / Windsurf:** Add SYSTEM-PROMPT.md as a project-level context file (CLAUDE.md, .cursor/rules, etc.). Agents run as separate sessions with the appropriate agent file loaded.

**Any other AI:** Copy and paste SYSTEM-PROMPT.md + the relevant agent file into the context. The frameworks work regardless of model — only tool-specific sections (browser automation, API posting) require compatible tools.

**When switching AIs:** The hardcoded tool calls (Desktop Commander, OpenClaw, Telegram) in the original config won't work. Use generic equivalents: `read_file`, `write_file`, `web_search`. The frameworks are model-agnostic; the tooling is not.

---

## Sharing This System

**To share with a collaborator:**
1. Fork or clone this repo
2. They configure their own paths in SYSTEM-PROMPT.md
3. They create their own `resources/api-keys.md` (never shared)
4. They load the agents into their AI of choice

**Their data stays separate.** The `projects/` folder is local to each user.
The `agents/` folder is the shared, version-controlled system.

---

## Key Concepts

| Concept | Where It Lives |
|---------|---------------|
| Insight Pyramid (Data → Information → Findings → Insight) | `02-Market-Research-Agent.md` |
| What If? ideation | `04-Creative-Agent.md` |
| COM-B / Fogg / Cialdini behavioral architecture | `03-Strategy-Agent.md` |
| GOST planning framework | `03-Strategy-Agent.md` |
| Paid vs. organic media split | `03-Strategy-Agent.md` |
| Copy approval hard lock | `05-Production-Agent.md` |
| Learning log | `07-Deployment-Agent.md` |
| Client profile + strategy history | `templates/CLIENT-PROFILE-TEMPLATE.md` |
| Revision classification (A/B/C/D) | `agents/REVISION-PROTOCOL.md` |

---

## Contributing

This system is designed to grow. If you improve an agent, add a framework, or build
a new template — update the version number in the file footer and note what changed.

---

## License

MIT. Use it, fork it, build on it.
