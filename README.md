# AMP Agency Agent System

An AI-native marketing agency that runs inside any AI assistant.
Brief in → research → strategy → creative → production → live campaign.

**→ [5-minute setup below](#setup)**

---

## What It Does

You give it a client and a goal. It runs the full agency workflow:

1. **Research** — digs into the category, competitors, culture, and audience. Surfaces the insight no one has said out loud yet.
2. **Strategy** — turns the insight into a creative brief, positioning, media strategy, and GOST plan.
3. **Creative** — generates concepts using What If? ideation, channel-constrained copy, and visual direction.
4. **Production** — builds assets across Canva, Word, PowerPoint, HTML, and image generation.
5. **Analytics** — sets up UTM tracking, KPI frameworks, and reporting structure.
6. **Campaign Management** — launches, monitors performance, schedules content, sends alerts, writes reports.

Every campaign feeds its learnings back into the next one via a client profile and learning log.

---

## Works With

- **Claude** (claude.ai, Claude Desktop, Claude Code) — recommended
- **ChatGPT / GPT-4o** — paste STARTER-PROMPT.md as first message
- **Gemini** — paste STARTER-PROMPT.md as first message
- **Cursor, Windsurf, any IDE with AI**
- **Any AI that can read a text file**

> **API vs. web:** Claude.ai and ChatGPT web interfaces work via copy-paste.
> Programmatic agent execution (Campaign Management auto-posting, Research Agent
> batch searches) requires API keys for each service used.

---

## Setup

### Option A — Automated (Mac/Linux, recommended)

```bash
git clone https://github.com/unseeng33k/amp-agency-system.git
cd amp-agency-system
chmod +x setup.sh
./setup.sh
```

The script asks you three questions, writes your config, and prints a ready-to-paste prompt. Done.

### Option B — Manual (5 minutes, any OS)

**Step 1 — Clone or download**
```bash
git clone https://github.com/unseeng33k/amp-agency-system.git
```
Or download as ZIP and unzip anywhere you like.

**Step 2 — Open `agents/SYSTEM-PROMPT.md` and set your paths**

Find this block near the top and fill in your actual folder path:
```
VAULT_ROOT:    /paste/your/path/to/amp-agency-system
PROJECTS_ROOT: /paste/your/path/to/amp-agency-system/projects
SKILLS_PATH:   /paste/your/path/to/amp-agency-system/resources/skills
```

Example (Mac):
```
VAULT_ROOT:    /Users/yourname/Documents/amp-agency-system
PROJECTS_ROOT: /Users/yourname/Documents/amp-agency-system/projects
SKILLS_PATH:   /Users/yourname/Documents/amp-agency-system/resources/skills
```

**Step 3 — Create your api-keys.md**

Copy `resources/api-keys-template.md` to `resources/api-keys.md` and fill in
whatever keys you have. Skip any you don't — the agents will tell you what's missing.

```bash
cp resources/api-keys-template.md resources/api-keys.md
```

**Step 4 — Load the starter prompt into your AI**

Open `STARTER-PROMPT.md` (in the root of this repo).
Copy the entire contents. Paste it as your first message to your AI.

That's it. The system is running.

---

## Running Your First Campaign

After pasting the starter prompt, say:

> "I need to run a campaign for [client name]. They [what they do]. I want to [objective]."

The Account Management Agent handles everything from there.

---

## AI-Specific Setup

### Claude (claude.ai)
Paste `STARTER-PROMPT.md` as your first message. If you have Desktop Commander connected, it will read the files automatically. If not, upload `agents/SYSTEM-PROMPT.md` directly.

### ChatGPT
Upload `agents/SYSTEM-PROMPT.md` as a file attachment. Then paste the contents of `STARTER-PROMPT.md` as your first message.

### Cursor / Claude Code
Copy `agents/SYSTEM-PROMPT.md` content into your `CLAUDE.md` or `.cursorrules` file. The agents will be available in every session automatically.

### Any other AI
Paste `STARTER-PROMPT.md` as your first message. If the AI can read files, point it at `agents/SYSTEM-PROMPT.md`. If not, paste the file contents directly.

---

## Folder Structure

```
amp-agency-system/
  STARTER-PROMPT.md       ← Paste this into your AI to start
  README.md               ← This file
  setup.sh                ← Automated setup script (Mac/Linux)
  .gitignore
  agents/                 ← The 13 agent files
  templates/              ← Client profile template
  projects/               ← Your work lives here (not committed)
    clients/
    [project-id]/
  resources/
    api-keys-template.md  ← Copy this to api-keys.md and fill in
    api-keys.md           ← YOUR KEYS — never committed
```

---

## Key Concepts

| Concept | File |
|---------|------|
| Insight Pyramid | `agents/02-Market-Research-Agent.md` |
| What If? ideation | `agents/04-Creative-Agent.md` |
| COM-B behavioral architecture | `agents/03-Strategy-Agent.md` |
| GOST planning | `agents/03-Strategy-Agent.md` |
| Paid vs. organic media split | `agents/03-Strategy-Agent.md` |
| Adoption Ladder persona template | `agents/02-Market-Research-Agent.md` |
| Competitor timing intelligence | `agents/02-Market-Research-Agent.md` |
| Copy approval hard lock | `agents/05-Production-Agent.md` |
| Campaign scheduling + alerts | `agents/07-Campaign-Management-Agent.md` |
| Client profile + learning log | `templates/CLIENT-PROFILE-TEMPLATE.md` |
| Revision classification (A/B/C/D) | `agents/REVISION-PROTOCOL.md` |

---

## Sharing With a Collaborator

1. Send them the repo link: `https://github.com/unseeng33k/amp-agency-system`
2. They clone it, run `./setup.sh` (or do the manual steps above)
3. They create their own `resources/api-keys.md` with their own keys
4. Their `projects/` folder stays local — never committed to the shared repo

The agents are shared. The work is private.

---

## License

MIT. Use it, fork it, build on it.
