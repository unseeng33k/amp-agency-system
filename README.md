# AMP Agency System

**An AI that runs a full marketing agency. You give it a client and a goal. It does the rest.**

Brief in → research → strategy → creative → production → live campaign.

---

## What does it actually do?

Think of it like hiring a whole agency team, except it's AI:

- 🔍 **Research** — reads Reddit, searches the web, digs through competitors. Finds the hidden truth nobody in your category has said out loud yet.
- 🧠 **Strategy** — turns that truth into a plan. What to say, who to say it to, where to say it.
- ✏️ **Creative** — writes the actual words and concepts for your campaign.
- 🎨 **Production** — builds the assets. Social graphics, emails, decks, documents.
- 📊 **Analytics** — sets up tracking so you know if it's working.
- 🚀 **Campaign Management** — launches everything, watches the numbers, sends you updates.

Every campaign remembers what worked and what didn't, so the next one is smarter.

---

## What do I need?

Just an AI assistant. That's it to start.

- **Claude** (claude.ai) — works best, recommended
- **ChatGPT** (chat.openai.com) — works great
- **Gemini** (gemini.google.com) — works great
- **Any other AI** — if it can read text, it works

You don't need to pay for anything extra to get started. Some advanced features
(like auto-posting to social media) need API keys, but the core agency workflow
works with just your free AI account.

---

## Setup — Pick Your Path

### 🟢 Option A — Mac or Linux (30 seconds, automated)

Open Terminal and paste these three lines:

```bash
git clone https://github.com/unseeng33k/amp-agency-system.git
cd amp-agency-system
./setup.sh
```

The script will ask where you put the folder, set everything up, and tell you exactly what to do next.

> **Don't have git?** [Download it here](https://git-scm.com/downloads) — takes 2 minutes to install.

---

### 🔵 Option B — Windows or "I don't like terminals" (5 minutes, no coding)

**Step 1 — Download the files**

Go to: `https://github.com/unseeng33k/amp-agency-system`

Click the green **Code** button → **Download ZIP** → unzip it somewhere easy to find
(like your Desktop or Documents folder).

---

**Step 2 — Tell it where you put the folder**

Open the folder you just unzipped. Go into the `agents` subfolder.
Open the file called `SYSTEM-PROMPT.md` in any text editor (Notepad, TextEdit, VS Code — anything).

Near the top you'll see this:

```
VAULT_ROOT:    [path to the AMP-Agency-System folder]
PROJECTS_ROOT: [path to the projects folder]
SKILLS_PATH:   [path to local skills folder]
API_KEYS_PATH: [path to your api-keys.md file]
```

Replace each `[path to...]` with the actual location of your folder.

**On Mac it looks like:**
```
VAULT_ROOT:    /Users/yourname/Documents/amp-agency-system
PROJECTS_ROOT: /Users/yourname/Documents/amp-agency-system/projects
SKILLS_PATH:   /Users/yourname/Documents/amp-agency-system/resources/skills
API_KEYS_PATH: /Users/yourname/Documents/amp-agency-system/resources/api-keys.md
```

**On Windows it looks like:**
```
VAULT_ROOT:    C:\Users\yourname\Documents\amp-agency-system
PROJECTS_ROOT: C:\Users\yourname\Documents\amp-agency-system\projects
SKILLS_PATH:   C:\Users\yourname\Documents\amp-agency-system\resources\skills
API_KEYS_PATH: C:\Users\yourname\Documents\amp-agency-system\resources\api-keys.md
```

Save the file.

---

**Step 3 — Add your API keys (optional but recommended)**

Inside the `resources` folder, find `api-keys-template.md`.
Copy that file and rename the copy to `api-keys.md`.
Open it and fill in whatever keys you have. Leave blank anything you don't have yet.

> **You don't need any keys to start.** The system will tell you what's missing
> when you need a specific feature.

---

**Step 4 — Start using it**

Open the file called `STARTER-PROMPT.md` in the main folder.
Select all the text. Copy it. Paste it as your **first message** in Claude, ChatGPT, or Gemini.

Then say something like:

> *"I need to run a campaign for [your client]. They sell [what they sell]. I want to [your goal]."*

That's it. The system takes over from there.

---

## 📧 Getting Updates and Alerts by Email

Email is the easiest way to get campaign updates, performance reports, and alerts —
no extra apps needed. To set it up:

1. Sign up for a free account at [agentmail.to](https://agentmail.to)
2. Copy your API key from their dashboard
3. Add it to your `api-keys.md` file under `AgentMail:`

Once connected, the Campaign Management Agent will:
- Draft weekly performance reports to your inbox
- Alert you if an ad gets flagged or a link breaks
- Send campaign summaries when launches complete

You review and approve before anything gets sent. The AI drafts, you send.

> **Other alert options:** Slack webhook (if your team uses Slack) or BlueBubbles (iMessage, Mac only).
> But email works everywhere and needs nothing extra installed.

---

## Running Your First Campaign

After pasting the starter prompt, say:

> *"I need to run a campaign for [client name]. They [what they do]. I want to [goal]."*

The system will ask you a few quick questions, then run the full workflow automatically.
You'll get checkpoints for approval at three moments:
1. After research — before strategy is written
2. After strategy — before creative starts
3. Before launch — before anything goes live

Nothing publishes without your "go."

---

## What's in the box

```
amp-agency-system/
  STARTER-PROMPT.md     ← The one file you paste into your AI
  README.md             ← This file
  setup.sh              ← Automated setup (Mac/Linux)
  agents/               ← The 13 instruction files that run the agency
  templates/            ← Client profile template
  projects/             ← Your work goes here (private, not shared)
  resources/
    api-keys-template.md  ← Copy this, rename to api-keys.md, fill in
    api-keys.md           ← Your private keys — never shared online
```

---

## Frequently Asked Questions

**Do I need to pay for anything?**
No. The core system works with free AI accounts (Claude, ChatGPT, Gemini).
Some features like auto-posting to social media or email campaigns need API keys
from those platforms, but most are free tiers.

**Do I need to know how to code?**
No. You edit two text files and paste one thing into your AI. That's the whole setup.

**What if I mess something up?**
Just re-download the ZIP from GitHub and start over. Nothing is permanent.

**Can I use this for multiple clients?**
Yes. Each client gets their own folder in `projects/clients/`. The system keeps them separate.

**Can I share this with my team?**
Yes. Everyone clones the repo and runs `./setup.sh`. Each person has their own `api-keys.md`
that stays on their computer and never gets shared. The agent files are shared. The work is private.

**What if I don't have all the API keys?**
Skip them. The agents will tell you when a feature needs a key you don't have yet.
The core research and strategy workflow needs nothing except your AI account.

---

## License

MIT. Free to use, fork, and build on.
