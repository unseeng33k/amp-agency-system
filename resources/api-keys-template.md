# API Keys — [Your Name]
# =========================================
# DO NOT COMMIT THIS FILE
# This file is listed in .gitignore
# Each user creates their own version locally
# =========================================

## AI / LLM
Anthropic:          [from console.anthropic.com]
OpenAI:             [from platform.openai.com — DALL-E image gen + GPT-Image]
OpenRouter:         [from openrouter.ai — multi-model routing/fallback]
xAI/Grok:           [from console.x.ai — real-time web data]
Moonshot/Kimi:      [from platform.moonshot.cn — long-context research]

## Search
Brave Search:       [from brave.com/search/api]
Google Places:      [from console.cloud.google.com]
Google Analytics:   [Account ID from analytics.google.com]
Google Cloud OAuth: [client_id + client_secret from console.cloud.google.com]
Google Search Console: [no key needed — OAuth tokens stored at ~/.gsc-mcp/tokens/]
                       [one token file per client: ~/.gsc-mcp/tokens/[client-slug].json]
                       [authenticate: node [path-to]/authenticate.js --account [client-slug]]

## Social / Campaign Management
X Consumer Key:     [from developer.twitter.com → your app]
X Consumer Secret:  [from developer.twitter.com → your app]
X Bearer Token:     [from developer.twitter.com → your app]
X Access Token:     [from developer.twitter.com → your app]
X Access Secret:    [from developer.twitter.com → your app]
X Client ID:        [OAuth 2.0 Client ID from developer.twitter.com]
X Client Secret:    [OAuth 2.0 Client Secret from developer.twitter.com]
Composio:           [from platform.composio.dev — LinkedIn, Instagram, TikTok, etc.]

## Email
AgentMail:          [from agentmail.to]

## Messaging / Alerts
BlueBubbles:        [server URL + password from your BlueBubbles instance]

## Design & Image Generation
Canva:              [connected via MCP — OAuth, no key needed]
Unsplash Access Key:[from unsplash.com/developers — free commercial use, attribution required]
Adobe PDF Services: [client_id from developer.adobe.com/console]
Adobe PDF Secret:   [client_secret — paired with above]
Adobe Access Token: [generated via client_credentials grant — expires, regenerate as needed]

## Office / Productivity
Microsoft Office:   [connected via MCP — uses local Office install, no key needed]
Adobe Acrobat:      [installed locally — controlled via osascript, no key needed]
