# Client Profile Template

> One file per client. Lives at: `/projects/clients/[client-slug]/client-profile.md`
> Created by Account Management Agent at first project kickoff.
> Updated after every project closes.
> Read by every agent before starting any phase for this client.

---

## Why This File Exists

Every project that starts without client context starts cold.
Cold starts waste research cycles on things already known, produce briefs
that miss established brand constraints, and create creative that repeats
what already failed.

This file is the institutional memory for a client relationship.
It is built once and grows with every engagement.

---

## Section 1 — Client Identity

```yaml
client_name:        [Official brand or company name]
client_slug:        [url-safe short name e.g. modern-mining]
industry:           [Category — be specific: ASIC mining, oncology, B2B SaaS, etc.]
primary_contact:    [Name, title, communication style notes]
relationship_start: [YYYY-MM-DD]
account_owner:      [Michael / AMP team lead]
profile_version:    [v1, v2, etc.]
last_updated:       [YYYY-MM-DD]
```

---

## Section 2 — Business Context

**What they do:**
[2-3 sentences. What the business actually does, who buys from them, how they make money.]

**Business model:**
[B2B / B2C / DTC / marketplace / service / product / hybrid]

**Revenue drivers:**
[What are the 1-3 things that actually drive revenue for this client?]

**Current business challenge:**
[What problem is the client trying to solve RIGHT NOW? Not the marketing problem — the business problem.]

**Competitive position:**
[Are they a market leader, challenger, niche player, or new entrant?
Who are their 2-3 primary competitors?]

**Geography:**
[Where do they operate? Any geographic constraints on messaging?]

---

## Section 3 — Audience

**Primary audience:**
[Not demographic — behavioral. Who is the person they most need to reach and why?]

**Secondary audiences:**
[Any additional audiences that matter — e.g. channel partners, press, investors]

**What the audience believes about this category right now:**
[Current mental model — before the brand does anything]

**What the brand needs the audience to believe:**
[The desired mental model after a successful campaign]

**Audience language:**
[How does this audience actually talk about the problem/product/category?
Use their words, not marketing words. Pull from reviews, forums, community posts.]

---

## Section 4 — Brand

**Brand positioning (current, if established):**
[How the brand currently describes itself]

**Brand voice:**
[3-5 words. What it sounds like when it's at its best.]

**What the brand must NEVER sound like:**
[The voice, tone, or language that is off-limits — explicitly stated or learned from experience]

**Visual identity constraints:**
[Any non-negotiables: colors, logos, imagery style, typography restrictions]

**Brand assets on file:**
[List any brand guidelines, logo files, approved imagery — with file paths]

---

## Section 5 — What We Know About What Works

> This section is empty at project start. It fills in after the first campaign.
> It is the most valuable section over time.

**What has worked (with context):**
```
Campaign: [name]
Date: [YYYY-MM]
Channel: [where it ran]
What worked: [specific creative, message, or format that performed above benchmark]
Why we think it worked: [hypothesis — connect to insight or behavioral lever]
Result: [metric + actual number]
```

**What has NOT worked (with context):**
```
Campaign: [name]
Date: [YYYY-MM]
Channel: [where it ran]
What failed: [specific creative, message, format, or targeting that underperformed]
Why we think it failed: [hypothesis]
Result: [metric + actual number]
Confirmed off-limits: [YES/NO — should this never be tried again, or just in this context?]
```

**Client feedback patterns:**
[What does this client consistently push back on?
What do they always love? What words or phrases trigger resistance?]

---

## Section 6 — Platform & Channel Access

**Owned platforms:**
[List every platform the client has an account on — with handles if known]

```
Platform:       [LinkedIn / Instagram / X / Facebook / TikTok / Email / etc.]
Handle/URL:     [@handle or URL]
Follower count: [approximate, as of last project]
Access level:   [Full admin / Content only / View only / No access]
API connected:  [YES/NO]
Notes:          [Any platform-specific constraints or history]
```

**Email list:**
[Size, platform used (Mailchimp, HubSpot, Klaviyo, etc.), list health notes]

**Website:**
[URL, CMS platform, who has access, any known technical constraints]

**Ad accounts:**
[Facebook Business Manager ID, LinkedIn Campaign Manager ID, Google Ads ID — if accessible]

---

## Section 7 — Budget & Constraints

**Typical campaign budget range:**
[Rough order of magnitude — not exact. Helps scope media strategy and production.]

**Budget split (if known):**
[% production vs. % media spend]

**Timeline constraints:**
[Anything that affects timing — seasonal peaks, product launches, fiscal year,
regulatory review cycles, competitive response windows]

**Decision-making speed:**
[How fast does this client approve work? Days? Weeks?
What slows them down?]

**Approval chain:**
[Who reviews? Who has final say? Any stakeholders who can veto?]

---

## Section 8 — Learning Log

> Updated after every project closes. The Deployment Agent populates initial
> performance data. The AM Agent translates it into strategic learning.

```markdown
## Project: [project-name] — [YYYY-MM]

**The insight we used:**
[Verbatim from key-insights.md]

**The behavioral lever we pulled:**
[COM-B barrier targeted / Cialdini mechanic / Fogg trigger]

**The media strategy:**
[Channels, formats, phase sequence]

**What the data showed:**
[Key metrics vs. benchmark — be specific]

**Did the insight hold up?**
[YES / PARTIAL / NO — explain]

**What we'd do differently:**
[The one thing that would make the next brief better]
```

---

## Section 9 — Stakeholder Map

> Who has a vote in approving this brand's work? What do they care about?
> How do you communicate with each of them effectively?
> This section prevents the most common cause of good work dying in approval.

For each key stakeholder at the client, fill in:

```markdown
### [Name or Role]
**Title / function:**
**DISC profile (if known):** [Red/Blue/Green/Yellow or combination]
**What they care about most:**
**What slows them down:**
**How to communicate with them:**
  - Lead with: [recommendation / data / relationship / vision]
  - Avoid: [emotion / abstraction / surprises / jargon]
  - Format: [bullets / narrative / visual / verbal]
**Approval authority:** [Final say / Influences / Review only]
**Speed of decision:** [Fast / Methodical / Depends on topic]
**How to present recommendations:**
  1. What — 1-2 sentence summary of the recommendation
  2. Why — rationale grounded in their priorities
  3. How — the key steps or data behind it
  4. Next steps — clear and owned
```

**The rule:** Never surprise a stakeholder. Socialize before you formalize.
Know who can say yes and who can only say no. Route accordingly.

---

**At first project kickoff, the Account Management Agent:**

1. Fires these searches to pre-populate Sections 1-3:
```
web_search("[client name] about company")
web_search("[client name] competitors [industry]")
web_search("[client name] reviews OR testimonials")
web_search("[client name] site:x.com OR linkedin.com")
```

2. Fills what can be filled from search + brief
3. Flags incomplete sections to Michael with ONE question:
   "I need [specific missing context] to complete the client profile. Can you fill this in?"
4. Saves to `/projects/clients/[client-slug]/client-profile.md`

**Every agent that runs a project for this client:**
- Reads `client-profile.md` before starting their phase
- Never researches something already documented here
- Appends to Section 5 (What Works / Doesn't Work) if new performance data emerges

**After every project closes:**
- Deployment Agent adds performance data to Section 8 (Learning Log)
- AM Agent reviews and updates Section 5 with strategic interpretation
- Profile version number increments

---

## File Naming & Location

```
/projects/clients/[client-slug]/client-profile.md
```

Examples:
```
/projects/clients/modern-mining/client-profile.md
/projects/clients/acme-pharma/client-profile.md
/projects/clients/sanofi-vaccines/client-profile.md
```

This file is never inside a project folder. It lives at the client level,
above all projects, because it persists across every engagement.
