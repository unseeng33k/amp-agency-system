# Client Onboarding Protocol

> Creates a new client in the AMP Agency System with full folder structure,
> platform access survey, and API connection checklist.
> Run this immediately when Michael says "I have a new client" or similar.

---

## Trigger

Activate when Michael mentions:
- "New client"
- "I need to set up a client"
- "We just won [client name]"
- "I want to onboard [company]"
- Any mention of starting work with a new company/brand

---

## Phase 1 — Client Discovery (First 60 Seconds)

Extract from Michael's message or ask ONE clarifying question:

```
CLIENT_NAME:        [Official company/brand name]
CLIENT_SLUG:        [url-safe short name, e.g., "acme-corp"]
INDUSTRY:           [Specific category — ASIC mining, B2B SaaS, pharma, etc.]
PRIMARY_CONTACT:    [Name, title — if known]
RELATIONSHIP_TYPE:  [New business / Existing relationship / Referral]
```

**If client name is ambiguous:** Ask ONE question: "What's the exact company name and website?"

---

## Phase 2 — Folder Structure Creation

Create immediately without asking permission:

```
/projects/clients/[client-slug]/
├── client-profile.md          ← From template, Sections 1-4 pre-populated
├── api-connections.md         ← Tracks all platform connections
├── projects/                  ← All projects for this client
├── assets/                    ← Brand guidelines, logos, approved imagery
│   └── brand-intelligence.md  ← NEW: voice, tone, visual signals from existing content
├── research/                  ← Market research, competitor analysis
└── _archive/                  ← Old campaigns, completed work
```

**Execute:**
```bash
mkdir -p /projects/clients/[client-slug]/{projects,assets,research,_archive}
touch /projects/clients/[client-slug]/api-connections.md
```

---

## Phase 3 — Pre-Populate Client Profile

Fire these searches in parallel to fill Sections 1-3:

```
web_search("[client_name] about company business model")
web_search("[client_name] competitors [industry]")
web_search("[client_name] reviews testimonials")
web_search("[client_name] site:linkedin.com company")
web_search("[client_name] funding valuation investors")
```

Extract and populate:
- Section 1: Client Identity
- Section 2: Business Context (what they do, business model, revenue drivers)
- Section 3: Audience (what people say about them, language used)

Save to: `/projects/clients/[client-slug]/client-profile.md`

---

## Phase 3b — Brand Intelligence Extraction

This step runs immediately after Phase 3, in parallel with Phase 4.
Do not skip it. Do not defer it to the first project.

The goal: extract brand voice signals from the client's existing content
before any brief is written. Every downstream agent — especially Creative —
needs this. Without it, the first brief starts cold.

### Step 1 — Fetch the client's own content

```python
# Fetch in this order — each source reveals different voice signals

# 1. Website — About page and homepage copy (highest signal)
web_fetch("[client_website]/about")
web_fetch("[client_website]")  # homepage

# 2. Website — Any blog, news, or editorial content
web_search("[client_name] site:[client_domain] blog OR news OR insights")
web_fetch([top result URL])

# 3. X/Twitter — their actual posts (not about them — BY them)
web_fetch("https://x.com/[client_handle]")
web_search("from:[client_handle] site:x.com")

# 4. LinkedIn — company page posts
web_fetch("https://linkedin.com/company/[client_slug]/posts")

# 5. Any press releases or founder interviews
web_search("[client_name] founder interview OR press release OR CEO quote")
```

### Step 2 — Extract brand signals from the content

For each content source fetched, extract:

```
VOICE OBSERVATIONS:
  - Sentence length: [long/medium/short/mixed]
  - Formality: [very formal / professional / conversational / casual]
  - Person: [first person "we" / second person "you" / third person]
  - Characteristic words/phrases: [specific language they repeat]
  - What they lead with: [product? mission? customer? proof?]

TONE OBSERVATIONS:
  - Primary tone: [authoritative / approachable / technical / inspirational / etc.]
  - Emotional register: [warm / neutral / urgent / confident / humble / etc.]
  - What they avoid: [jargon? emotion? numbers? stories?]

CONTENT PATTERNS:
  - What topics they own confidently
  - What topics they avoid or hedge on
  - How they talk about competitors (directly? indirectly? not at all?)
  - How they talk about customers (heroes? beneficiaries? partners?)

LANGUAGE THAT APPEARS REPEATEDLY:
  [Pull verbatim phrases — these are the brand's natural vocabulary]

LANGUAGE THAT FEELS OFF OR ABSENT:
  [What's conspicuously missing? What would feel wrong coming from this brand?]
```

### Step 3 — Write brand-intelligence.md

Save to: `/projects/clients/[client-slug]/assets/brand-intelligence.md`

```markdown
# Brand Intelligence — [Client Name]
> Extracted during onboarding from client's existing content.
> Updated after first campaign closes with observed performance data.
> Last updated: [YYYY-MM-DD]

---

## Voice Profile

**In their own words:**
[3-5 direct quotes pulled verbatim from their website or social content.
These are the clearest signal of natural brand voice.]

**Voice in 3-5 words:**
[Distilled from the content — not what they claim to be, what they sound like]

**Sentence structure:**
[Short and punchy / Long and considered / Mixed / etc.]

**Person and address:**
[How do they refer to themselves and their audience?]

**Characteristic phrases:**
[Specific language, formulations, or words they return to repeatedly]

---

## Tone

**Primary tone:** [authoritative / approachable / technical / inspirational / etc.]
**Secondary tone:** [if there's a visible secondary register]

**What they lean into:**
[The emotional territory they occupy most consistently]

**What they avoid:**
[Tone, language, or emotional register conspicuously absent from their content]

---

## Content Patterns

**What they lead with:**
[Product features? Mission? Customer outcomes? Data? Story?]

**How they talk about customers:**
[Heroes? Beneficiaries? Partners? Challenges? Solutions?]

**How they talk about competitors:**
[Directly / indirectly / category language only / not at all]

**Topics they own confidently:**
[List of themes they address with authority]

**Topics they hedge on or avoid:**
[List of themes they sidestep or approach carefully]

---

## Brand Vocabulary

**Words and phrases to use:**
[Pulled directly from their content — these feel native]

**Words and phrases to avoid:**
[Anything that would feel off-brand, out of register, or like it came from a competitor]

---

## Visual Identity Signals
> Extracted from website and social imagery — what visual language do they use?

**Color impression:** [from website — dark/light/colorful/muted/etc.]
**Photography style:** [lifestyle/product/abstract/illustrated/etc.]
**Typography feel:** [from website — serif/sans/modern/classic/etc.]
**Overall visual register:** [premium/approachable/technical/human/etc.]

**Known brand assets on file:**
[List any brand guidelines, logo files, or visual references uploaded during onboarding]
[Path: /projects/clients/[client-slug]/assets/]

---

## What Onboarding Content Was Analyzed

| Source | URL | Date Fetched | Signal Quality |
|--------|-----|-------------|----------------|
| About page | [URL] | [date] | [High/Medium/Low] |
| Homepage | [URL] | [date] | [High/Medium/Low] |
| Blog/editorial | [URL] | [date] | [High/Medium/Low] |
| X/Twitter | [URL] | [date] | [High/Medium/Low] |
| LinkedIn | [URL] | [date] | [High/Medium/Low] |

**Gaps:** [What content was unavailable or thin? What should be reviewed when more content exists?]

---

## Confidence Level

**High confidence:** [Voice elements consistently present across multiple sources]
**Low confidence:** [Voice elements inferred from limited content — verify with client]
**Unknown:** [Elements not inferable from available content — ask during first project]
```

### Step 4 — Partially fill client-profile.md Section 4

Using brand-intelligence.md as the source, pre-fill Section 4 fields:

```
Section 4 — Brand (pre-populated from onboarding content analysis):

Brand voice (3-5 words): [from brand-intelligence.md]
What the brand must NEVER sound like: [from tone avoidance observations]
Visual identity constraints: [from visual signals — note as "inferred, verify"]
Brand assets on file: [list anything uploaded, or "none yet"]

Note on all Section 4 entries: "Extracted from existing content during onboarding.
Verify with client before first brief. Flag discrepancies to AM Agent."
```

**The "verify with client" flag is important.** Brand intelligence extracted from
content is an inference, not a briefing. The client may have rebrand plans, known
constraints, or strong opinions that aren't visible from their current content.
The goal is to start informed, not to claim authority over the brand.

### Step 5 — Flag brand intelligence gaps to Michael

After writing brand-intelligence.md, surface any significant gaps:

```
BRAND INTELLIGENCE GAPS — [Client Name]

HIGH PRIORITY (will affect first brief):
[ ] [Specific gap — e.g., "No editorial content found — voice inference is thin"]
[ ] [e.g., "X account has < 10 posts — insufficient voice sample"]
[ ] [e.g., "Website is placeholder / under construction — no copy to analyze"]

RECOMMENDED ACTIONS:
1. [Specific ask — e.g., "Request brand guidelines PDF before first brief"]
2. [e.g., "Review 3-5 competitor posts they admire to establish voice benchmark"]
3. [e.g., "Ask: what brands do you NOT want to sound like?"]
```

**If client has no existing content (new brand, pre-launch):**
Note in brand-intelligence.md: "New brand — no prior content exists.
Brand voice to be established during first project.
Recommend voice workshop as part of strategy phase."

---

## Phase 4 — Platform Access Survey

Present to Michael:

```
PLATFORM ACCESS SURVEY — [Client Name]

For each platform, mark what the client HAS:
□ Website (required) — URL: _______________
□ LinkedIn Company Page — URL: _______________
□ X/Twitter — Handle: _______________
□ Instagram — Handle: _______________
□ Facebook — Page: _______________
□ TikTok — Handle: _______________
□ YouTube — Channel: _______________
□ Email list — Platform: _______________ (Mailchimp/HubSpot/Klaviyo/etc.)
□ Google Search Console — Do they have this? _______________
□ Google Analytics — Do they have this? _______________
□ Ad accounts — Facebook/LinkedIn/Google: _______________
□ Other: _______________

ACCESS LEVEL:
□ Full admin access (we can post directly)
□ Content access (we create, they approve/post)
□ View only (we monitor, they execute)
□ No access yet (need to request)
```

**Extract from Michael's response and update client-profile.md Section 6.**

---

## Phase 5 — API Connection Checklist

Create `/projects/clients/[client-slug]/api-connections.md`:

```markdown
# API Connections — [Client Name]

> Tracks every platform connection needed for this client.
> Updated as connections are established.

## Connection Status Dashboard

| Platform | Status | API Key / OAuth | Connected By | Date |
|----------|--------|-----------------|--------------|------|
| X/Twitter | ⬜ Not Started | | | |
| LinkedIn | ⬜ Not Started | | | |
| Instagram | ⬜ Not Started | | | |
| TikTok | ⬜ Not Started | | | |
| AgentMail | ⬜ Not Started | | | |
| Google Search Console | ⬜ Not Started | | | |
| Google Analytics | ⬜ Not Started | | | |
| Unsplash | ⬜ Not Started | | | |

## Per-Platform Setup Instructions

### X/Twitter
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Prerequisites:**
- [ ] Client has X account: @_______
- [ ] Access level: Full admin / Content / View only
- [ ] Developer account needed: YES / NO (already have)

**Setup Steps:**
1. Go to https://developer.twitter.com
2. Create app named "[Client Name] AMP Agency"
3. Under Keys and Tokens, copy:
   - API Key → `X Consumer Key`
   - API Key Secret → `X Consumer Secret`
   - Bearer Token → `X Bearer Token`
4. Generate Access Token (requires Read+Write permissions)
   - Access Token → `X Access Token`
   - Access Token Secret → `X Access Secret`
5. Add to your personal `api-keys.md` under section:
   ```
   ## [Client Name] — X
   X Consumer Key:     
   X Consumer Secret:  
   X Bearer Token:     
   X Access Token:     
   X Access Secret:    
   ```

**Test Command:**
```bash
# Verify connection works
xurl verify --client [client-slug]
```

**Connected:** ⬜ / Date: _______

---

### LinkedIn
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Prerequisites:**
- [ ] Client has LinkedIn Company Page: _______
- [ ] You have admin access to post: YES / NO
- [ ] Or: Client will approve all posts: YES / NO

**Setup Steps:**
1. Go to https://linkedin.com/developers
2. Create app "[Client Name] AMP Agency"
3. Link to Company Page: _______
4. Under Auth tab, copy:
   - Client ID → `LinkedIn Client ID`
   - Client Secret → `LinkedIn Secret`
5. Request Products: "Share on LinkedIn" + "Sign In with LinkedIn"
6. Wait for approval (usually hours, email notification)
7. Add to your personal `api-keys.md`:
   ```
   ## [Client Name] — LinkedIn
   LinkedIn Client ID: 
   LinkedIn Secret:    
   ```

**Test Command:**
```bash
linkedin verify --client [client-slug]
```

**Connected:** ⬜ / Date: _______

---

### Instagram + TikTok (via Composio)
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Prerequisites:**
- [ ] Client has Instagram: @_______
- [ ] Client has TikTok: @_______
- [ ] Composio account exists: YES / NO

**Setup Steps:**
1. If no Composio account: Sign up at https://composio.dev
2. Copy API key from dashboard
3. Add to your personal `api-keys.md`:
   ```
   ## Composio (shared across clients)
   Composio: pg-your_key_here
   ```
4. Run connection commands:
   ```bash
   pip install composio-core
   export COMPOSIO_API_KEY="your_key_here"
   composio add instagram
   composio add tiktok
   ```
5. Browser will open — log in with client's credentials
6. Authorize AMP Agency access

**Note:** Composio handles OAuth refresh automatically. One setup works for all clients.

**Test Command:**
```bash
composio verify instagram --client [client-slug]
composio verify tiktok --client [client-slug]
```

**Connected:** ⬜ / Date: _______

---

### AgentMail (Email Alerts)
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Prerequisites:**
- [ ] AgentMail account exists: YES / NO

**Setup Steps:**
1. If no account: Sign up at https://agentmail.to (free tier)
2. Create inbox: "[client-slug]@agentmail.to"
3. Copy API key from dashboard
4. Add to your personal `api-keys.md`:
   ```
   ## [Client Name] — AgentMail
   AgentMail: am_us_your_key_here
   Inbox: [client-slug]@agentmail.to
   ```

**Test Command:**
```bash
agentmail send --to your-email@example.com --subject "Test from [Client Name]" --body "Connection verified"
```

**Connected:** ⬜ / Date: _______

---

### Google Search Console
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Prerequisites:**
- [ ] Client has GSC property: YES / NO
- [ ] Client can add you as user: YES / NO

**Setup Steps:**
1. Ask client to add your Google account:
   - Go to https://search.google.com/search-console
   - Settings → Users and permissions → Add user
   - Add: your-email@gmail.com
   - Permission: Full
2. Run authentication:
   ```bash
   node ~/.npm/_npx/[hash]/node_modules/google-searchconsole-mcp/dist/authenticate.js --account [client-slug]
   ```
3. Browser opens — select the client property
4. Token saved to: `~/.gsc-mcp/tokens/[client-slug].json`

**Update client-profile.md Section 6:**
```yaml
Google Search Console:
  Status: connected
  Account alias: [client-slug]
  Property URL: [sc-domain:clientdomain.com or https://clientdomain.com]
  Access level: Full
  Setup date: [YYYY-MM-DD]
```

**Test Command:**
```bash
gsc list_sites --account [client-slug]
```

**Connected:** ⬜ / Date: _______

---

### Google Analytics
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Prerequisites:**
- [ ] Client has GA4 property: YES / NO
- [ ] Property ID (format: G-XXXXXXXXXX): _______

**Setup Steps:**
1. Ask client to grant access:
   - Go to https://analytics.google.com
   - Admin → Account/Property → Property Access Management
   - Add user: your-email@gmail.com
   - Role: Viewer or Analyst
2. Record in `api-keys.md`:
   ```
   ## [Client Name] — Google Analytics
   GA4 Property ID: G-XXXXXXXXXX
   ```

**Connected:** ⬜ / Date: _______

---

### Unsplash (Stock Photos)
**Status:** ⬜ Not Started → 🟡 In Progress → 🟢 Connected

**Note:** Unsplash is shared across all clients. One key works for everyone.

**Prerequisites:**
- [ ] Unsplash developer account: YES / NO

**Setup Steps:**
1. If no account: https://unsplash.com/developers → "New Application"
2. Copy Access Key
3. Add to your personal `api-keys.md`:
   ```
   ## Shared — Unsplash
   Unsplash Access Key: your_access_key_here
   ```

**Connected:** ⬜ / Date: _______

---

## Quick Start Commands

After completing setup for a platform, run the verification:

```bash
# Verify all connections for this client
amp verify --client [client-slug]

# Check specific platform
amp verify --client [client-slug] --platform x
amp verify --client [client-slug] --platform linkedin
amp verify --client [client-slug] --platform instagram

# Generate connection report
amp report --client [client-slug] --output connections.html
```

---

## Onboarding Complete Checklist

Before declaring onboarding complete:

- [ ] Folder structure created (including assets/ subfolder)
- [ ] client-profile.md pre-populated (Sections 1-4, with Section 4 flagged "verify with client")
- [ ] **brand-intelligence.md written** (voice profile, tone, vocabulary, visual signals)
- [ ] **Brand intelligence gaps surfaced to Michael** (high priority gaps flagged)
- [ ] Platform Access Survey completed
- [ ] api-connections.md created with all platforms listed
- [ ] At least ONE platform connected (minimum viable)
- [ ] Michael has copy of api-connections.md
- [ ] Next steps clear (which connections to prioritize)

---

## Post-Onboarding: First Project

Once onboarding is complete, immediately:

1. **Update client-profile.md** with any new info from setup
2. **Create first project folder:**
   ```
   /projects/clients/[client-slug]/projects/proj-[YYYY]-[NNN]/
   ```
3. **Spawn Market Research Agent** with brief
4. **Mark in api-connections.md:** First project started [date]

---

## Output Contract

After onboarding, present to Michael:

```
CLIENT ONBOARDING COMPLETE: [Client Name]

FOLDER STRUCTURE:
✓ Created at /projects/clients/[client-slug]/

CLIENT PROFILE:
✓ Sections 1-3 complete (business context, audience, competitive)
✓ Section 4 pre-populated from content analysis (flagged: verify with client)
✓ Saved to client-profile.md

BRAND INTELLIGENCE:
✓ brand-intelligence.md written at /projects/clients/[client-slug]/assets/
  Voice profile: [3-5 word summary]
  Confidence: [High / Medium / Low — based on content volume available]
⚠️ Gaps: [list any high-priority gaps]

PLATFORM ACCESS:
[ ] Website: [URL]
[ ] LinkedIn: [URL/Not connected]
[ ] X/Twitter: [Handle/Not connected]
[ ] Instagram: [Handle/Not connected]
[ ] TikTok: [Handle/Not connected]
[ ] Email: [Platform/Not connected]
[ ] GSC: [Connected/Pending]
[ ] GA4: [Connected/Pending]

API CONNECTIONS:
✓ api-connections.md created with full setup instructions
[ ] X/Twitter: [Status]
[ ] LinkedIn: [Status]
[ ] Instagram/TikTok: [Status]
[ ] AgentMail: [Status]
[ ] Google Search Console: [Status]
[ ] Google Analytics: [Status]
[ ] Unsplash: [Status]

BRAND INTELLIGENCE GAPS (action needed before first brief):
1. [Gap + recommended action]
2. [Gap + recommended action]
3. [Gap + recommended action — or "None — confidence is high"]

IMMEDIATE NEXT STEPS:
1. [Highest priority connection to establish]
2. [Second priority]
3. [Third priority]

TO START FIRST PROJECT: Reply "Go" and give me the brief.
```

---

## Handoff to Account Management Agent

Once Michael replies "Go" with a brief:
1. Update `api-connections.md` with note: "First project started [date]"
2. SPAWN: Account Management Agent with the brief
3. Include in handoff:
   - Client profile location: `/projects/clients/[client-slug]/client-profile.md`
   - Brand intelligence location: `/projects/clients/[client-slug]/assets/brand-intelligence.md`
   - API connections location: `/projects/clients/[client-slug]/api-connections.md`
   - Recommended first platform to connect (highest priority from survey)
   - Any high-priority brand intelligence gaps that need resolution before first brief
