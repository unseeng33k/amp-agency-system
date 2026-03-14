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
├── client-profile.md          ← From template, pre-populated
├── api-connections.md         ← New: tracks all platform connections
├── projects/                  ← All projects for this client
├── assets/                    ← Brand guidelines, logos, approved imagery
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

- [ ] Folder structure created
- [ ] client-profile.md pre-populated (Sections 1-3)
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
✓ Pre-populated from web research
✓ Sections 1-3 complete
✓ Saved to client-profile.md

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

IMMEDIATE NEXT STEPS:
1. [Highest priority connection to establish]
2. [Second priority]
3. [Third priority]

TO START FIRST PROJECT: Reply "Go" and give me the brief.

## Handoff to Account Management Agent

Once Michael replies "Go" with a brief:
1. Update `api-connections.md` with note: "First project started [date]"
2. SPAWN: Account Management Agent with the brief
3. Include in handoff:
   - Client profile location: `/projects/clients/[client-slug]/client-profile.md`
   - API connections location: `/projects/clients/[client-slug]/api-connections.md`
   - Recommended first platform to connect (highest priority from survey)
```
