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

## 🔌 Connecting Apps and APIs (Optional — Unlocks Automation)

The system works without any of these. But connecting them turns it from
"AI that helps you write" into "AI that actually posts, monitors, and reports for you."

Here's every connection explained in plain English, what it unlocks, and exactly how to set it up.

---

### 📨 Email Alerts and Reports — AgentMail
**What it unlocks:** The system emails you campaign updates, performance reports, and alerts when something needs attention. You review and approve before anything sends.

**Cost:** Free tier available

**Setup:**
1. Go to [agentmail.to](https://agentmail.to) and create a free account
2. Copy your API key from the dashboard
3. Open your `api-keys.md` file and add it:
   ```
   AgentMail: am_us_your_key_here
   ```

---

### 🐦 Post to X / Twitter — X Developer Account
**What it unlocks:** The system can post tweets, reply to tweets, and continue threads automatically on your behalf.

**Cost:** Free (Basic tier is sufficient)

**Setup:**
1. Go to [developer.twitter.com](https://developer.twitter.com)
2. Sign in with your X account and click **"Sign up for Free Account"**
3. Create a new app — name it anything
4. Go to **"Keys and Tokens"** tab inside your app
5. Copy all five values into your `api-keys.md`:
   ```
   X Consumer Key:    (labeled "API Key")
   X Consumer Secret: (labeled "API Key Secret")
   X Bearer Token:    (labeled "Bearer Token")
   X Access Token:    (click "Generate" under Access Token)
   X Access Secret:   (shown alongside the Access Token)
   ```
6. Under **"App Settings"** → **"User authentication settings"** → enable **Read and Write** permissions

> ⚠️ Important: Set permissions to **Read and Write** BEFORE generating your Access Token. If you generate the token first, it won't have write access and posting will fail.

---

### 💼 Post to LinkedIn — LinkedIn Developer App
**What it unlocks:** Post original content, reply to comments, react to posts, and monitor your LinkedIn presence automatically.

**Cost:** Free

**Setup:**
1. Go to [linkedin.com/developers](https://www.linkedin.com/developers/) and click **"Create app"**
2. Fill in:
   - App name: anything (e.g., "My Agency System")
   - LinkedIn Page: select your personal profile or company page
   - App logo: upload anything
3. Click **"Create app"**
4. Go to the **"Auth"** tab and copy:
   ```
   LinkedIn Client ID:  (labeled "Client ID")
   LinkedIn Secret:     (labeled "Client Secret")
   ```
5. Under **"Products"** tab, request access to **"Share on LinkedIn"** and **"Sign In with LinkedIn"**
6. Add these to your `api-keys.md`

> Note: LinkedIn reviews app requests within a few hours. You'll get an email when approved.

---

### 📸 Instagram and 🎵 TikTok — Composio
**What it unlocks:** Post to Instagram and TikTok without needing to set up separate developer accounts for each.

**Cost:** Free tier available at [composio.dev](https://composio.dev)

**Setup:**
1. Create a free account at [composio.dev](https://composio.dev)
2. Copy your API key from the dashboard
3. Add it to `api-keys.md`:
   ```
   Composio: pg-your_key_here
   ```
4. Open Terminal and run:
   ```bash
   pip install composio-core
   export COMPOSIO_API_KEY="your_key_here"
   composio add instagram
   composio add tiktok
   ```
5. Each `add` command opens a browser window — log in with your account and authorize

---

### 🔍 Free Stock Photos — Unsplash
**What it unlocks:** The system can search and download free, commercially licensed photos for your campaigns automatically.

**Cost:** Free

**Setup:**
1. Go to [unsplash.com/developers](https://unsplash.com/developers) and click **"New Application"**
2. Accept the terms, fill in the app name and description (anything is fine)
3. Scroll down to find your **"Access Key"**
4. Add it to `api-keys.md`:
   ```
   Unsplash Access Key: your_access_key_here
   ```

---

### 🌐 Web Search — Brave Search API
**What it unlocks:** Gives the Research Agent access to real web search results (instead of relying only on the AI's built-in knowledge). Makes research significantly more accurate.

**Cost:** Free tier (2,000 searches/month)

**Setup:**
1. Go to [api.search.brave.com](https://api.search.brave.com) and sign up
2. Create a new subscription (Free Data tier is fine to start)
3. Copy your API key
4. Add it to `api-keys.md`:
   ```
   Brave Search: BSAy_your_key_here
   ```

---

### 📍 Location Data — Google Places API
**What it unlocks:** Lets the system find locations, businesses, and geographic data for research and targeting.

**Cost:** Free for low volume (Google gives $200/month free credit)

**Setup:**
1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Create a new project (or use an existing one)
3. Click **"Enable APIs and Services"** → search for **"Places API"** → enable it
4. Go to **"Credentials"** → **"Create Credentials"** → **"API Key"**
5. Add it to `api-keys.md`:
   ```
   Google Places: AIzaSy_your_key_here
   ```

---

### 📊 Google Search Console — See How Your Site Ranks
**What it unlocks:** The Analytics Agent can pull real organic search data — which keywords bring traffic, which pages rank, what's trending. Essential for SEO-linked campaigns.

**Cost:** Free

**Setup:**
1. Make sure your website is verified in [Google Search Console](https://search.google.com/search-console)
2. Open Terminal and run:
   ```bash
   npx -y google-searchconsole-mcp
   ```
3. A browser window will open — log in with the Google account that owns your Search Console
4. Grant read access when prompted
5. Restart your AI (Claude Desktop) — it will appear as a connected tool automatically

> Note: Only works with Claude Desktop. For other AIs, export data from Search Console as CSV and upload it manually.

---

### 🌐 Website & Landing Page Hosting — Vercel
**What it unlocks:** Every landing page and campaign microsite the system builds gets a live URL automatically. Without this, landing pages are code files that go nowhere. With it, Production Agent builds the page and deploys it to `campaign.vercel.app` (or your client's domain) in under 60 seconds. The URL goes straight into the UTM tracking sheet.

**Cost:** Free (Hobby plan is sufficient for campaigns)

**Setup:**
1. Go to [vercel.com](https://vercel.com) and create a free account
2. Open Terminal and run:
   ```bash
   npm i -g vercel
   vercel login
   ```
3. Follow the login prompts (opens browser for authentication)
4. Verify it worked:
   ```bash
   vercel whoami
   ```
   Should print your Vercel username.

**For programmatic deployments (optional):**
If you want the system to deploy automatically without prompts:
1. Go to [vercel.com/account/tokens](https://vercel.com/account/tokens)
2. Create a token named "AMP Agency System"
3. Add to `api-keys.md`:
   ```
   Vercel: your_token_here
   ```

**What it builds and deploys:**
- Campaign landing pages
- Product microsites
- Event pages
- Interactive campaign tools
- Any HTML/CSS/JS asset that needs a real URL

> **Already done this?** Run `vercel whoami` in Terminal to confirm you're still authenticated.

---

### 🖼️ Adobe PDF Services — Professional PDFs
**What it unlocks:** Generates high-quality PDFs for campaign reports, proposals, and presentations.

**Cost:** Free tier (500 document transactions/month)

**Setup:**
1. Go to [developer.adobe.com/console](https://developer.adobe.com/console)
2. Sign in with your Adobe account (or create one free)
3. Click **"Create new project"** → **"Add API"** → select **"PDF Services API"**
4. Choose **"OAuth Server-to-Server"** and follow the prompts
5. Copy the **Client ID** and **Client Secret**
6. Add to `api-keys.md`:
   ```
   Adobe PDF Services: your_client_id
   Adobe PDF Secret:   your_client_secret
   ```

---

### 💬 Push Alerts — Pick One
**What it unlocks:** Get instant notifications on your phone or desktop when something urgent happens — an ad gets flagged, a post goes viral, a link breaks.

Pick whichever fits your setup:

**Option A — Slack (easiest, works for teams)**
1. In Slack, go to [api.slack.com/apps](https://api.slack.com/apps) → **"Create New App"**
2. Choose **"From scratch"**, name it, select your workspace
3. Click **"Incoming Webhooks"** → toggle on → **"Add New Webhook to Workspace"**
4. Select a channel to post to → copy the webhook URL
5. Add to `api-keys.md`:
   ```
   Slack Webhook: https://hooks.slack.com/services/your/webhook/url
   ```

**Option B — iMessage / BlueBubbles (Mac only)**
1. Download [BlueBubbles](https://bluebubbles.app) on your Mac
2. Follow their setup guide to connect your iMessage account
3. Add the server URL and password to `api-keys.md`:
   ```
   BlueBubbles: https://your-server.trycloudflare.com
   ```

---

### 🔑 After Adding Keys — Tell the AI

Once you've added keys to `api-keys.md`, start a new chat with your AI and say:

> *"I've updated my api-keys.md. Please check what's connected and confirm which features are now available."*

The system will scan your keys, confirm what's active, and let you know if anything needs additional setup.

---

### Quick Reference — What Each Key Unlocks

| Service | What it enables | Free? |
|---------|----------------|-------|
| AgentMail | Email reports and alerts | ✅ Free tier |
| X / Twitter | Post, reply, read threads | ✅ Free |
| LinkedIn | Post, comment, react | ✅ Free |
| Composio | Instagram, TikTok posting | ✅ Free tier |
| Unsplash | Free stock photography | ✅ Free |
| Brave Search | Web research | ✅ Free tier |
| Google Places | Location data | ✅ Free ($200/mo credit) |
| Google Search Console | Organic search analytics | ✅ Free |
| Adobe PDF Services | Professional PDFs | ✅ Free tier |
| Slack Webhook | Team notifications | ✅ Free |
| Vercel | Live website/landing page hosting | ✅ Free |

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
  agents/               ← The 12 instruction files that run the agency
                           (8 agents + SYSTEM-PROMPT + SKILL-DISCOVERY-PROTOCOL + REVISION-PROTOCOL + Overview)
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
