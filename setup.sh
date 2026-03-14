#!/bin/bash

# AMP Agency System — Setup Script
# Works on Mac and Linux. Takes about 30 seconds.

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

clear
echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     AMP Agency System — Setup               ║${NC}"
echo -e "${BLUE}║     Should take about 30 seconds            ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════╝${NC}"
echo ""
echo "Hi! This script sets up the AMP Agency System for you."
echo "It will ask you one question, then do everything else automatically."
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo -e "${GREEN}Found the AMP folder at:${NC}"
echo "  $SCRIPT_DIR"
echo ""

# ── Step 1: Confirm location ──────────────────────────────────────────────────
echo -e "${YELLOW}Question 1 of 1:${NC}"
echo "Where did you put this folder? (Just press Enter to use the location above)"
echo ""
read -p "  Folder path [press Enter to confirm]: " VAULT_ROOT
VAULT_ROOT="${VAULT_ROOT:-$SCRIPT_DIR}"

PROJECTS_ROOT="$VAULT_ROOT/projects"
SKILLS_PATH="$VAULT_ROOT/resources/skills"
API_KEYS_PATH="$VAULT_ROOT/resources/api-keys.md"

echo ""
echo -e "${GREEN}Got it! Using these locations:${NC}"
echo "  Main folder:    $VAULT_ROOT"
echo "  Projects:       $PROJECTS_ROOT"
echo "  Skills:         $SKILLS_PATH"
echo "  API Keys:       $API_KEYS_PATH"
echo ""

# ── Step 2: Create folders ────────────────────────────────────────────────────
echo -e "Creating your project folders..."
mkdir -p "$PROJECTS_ROOT/clients"
mkdir -p "$VAULT_ROOT/resources/skills"
echo -e "  ${GREEN}✓${NC} Done"
echo ""

# ── Step 3: Write paths into config files ─────────────────────────────────────
echo -e "Saving your folder location into the config files..."

SYSTEM_PROMPT="$VAULT_ROOT/agents/SYSTEM-PROMPT.md"

if [ ! -f "$SYSTEM_PROMPT" ]; then
  echo ""
  echo "  ✗ Oops — can't find the agents/SYSTEM-PROMPT.md file."
  echo "    Make sure you're running this script from inside the amp-agency-system folder."
  echo "    Try: cd /path/to/amp-agency-system && ./setup.sh"
  exit 1
fi

sed -i.bak \
  -e "s|\[VAULT_ROOT\]|$VAULT_ROOT|g" \
  -e "s|\[PROJECTS_ROOT\]|$PROJECTS_ROOT|g" \
  -e "s|\[SKILLS_PATH\]|$SKILLS_PATH|g" \
  -e "s|\[API_KEYS_PATH\]|$API_KEYS_PATH|g" \
  "$SYSTEM_PROMPT"

SDP="$VAULT_ROOT/agents/SKILL-DISCOVERY-PROTOCOL.md"
if [ -f "$SDP" ]; then
  sed -i.bak \
    -e "s|\[VAULT_ROOT\]|$VAULT_ROOT|g" \
    -e "s|\[SKILLS_PATH\]|$SKILLS_PATH|g" \
    -e "s|\[API_KEYS_PATH\]|$API_KEYS_PATH|g" \
    "$SDP"
fi

STARTER="$VAULT_ROOT/STARTER-PROMPT.md"
if [ -f "$STARTER" ]; then
  sed -i.bak \
    -e "s|\[VAULT_ROOT\]|$VAULT_ROOT|g" \
    -e "s|\[PROJECTS_ROOT\]|$PROJECTS_ROOT|g" \
    "$STARTER"
fi

find "$VAULT_ROOT/agents" -name "*.bak" -delete 2>/dev/null
find "$VAULT_ROOT" -maxdepth 1 -name "*.bak" -delete 2>/dev/null

echo -e "  ${GREEN}✓${NC} Done"
echo ""

# ── Step 4: Create api-keys.md if missing ─────────────────────────────────────
API_TEMPLATE="$VAULT_ROOT/resources/api-keys-template.md"
if [ ! -f "$API_KEYS_PATH" ] && [ -f "$API_TEMPLATE" ]; then
  cp "$API_TEMPLATE" "$API_KEYS_PATH"
  echo -e "  ${GREEN}✓${NC} Created your api-keys.md file from the template"
  echo "    (You can fill this in later — it's optional to get started)"
  echo ""
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo -e "${GREEN}╔══════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Setup complete! You're ready to go.     ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BOLD}Here's what to do next:${NC}"
echo ""
echo -e "  ${BLUE}Step 1 — Open your STARTER-PROMPT.md file${NC}"
echo "  Location: $VAULT_ROOT/STARTER-PROMPT.md"
echo "  Select all the text and copy it."
echo ""
echo -e "  ${BLUE}Step 2 — Paste it into Claude, ChatGPT, or Gemini${NC}"
echo "  Just paste it as your very first message."
echo ""
echo -e "  ${BLUE}Step 3 — Tell it what you need${NC}"
echo "  Say something like:"
echo "  \"I need to run a campaign for [client]. They [what they do]. I want to [goal].\""
echo ""
echo -e "  ${BLUE}Optional: Add API keys for extra features${NC}"
echo "  Open: $API_KEYS_PATH"
echo "  Fill in whatever you have. Skip what you don't."
echo ""
echo -e "  ${BLUE}Optional: Set up email alerts${NC}"
echo "  Sign up free at agentmail.to, copy your key into api-keys.md under 'AgentMail:'"
echo "  The system will email you campaign updates and alerts automatically."
echo ""
echo -e "  ${BLUE}Optional: Make API keys available to scripts${NC}"
echo "  Add this to your ~/.zshrc or ~/.bashrc:"
echo "  export AMP_API_KEYS_PATH=\"$API_KEYS_PATH\""
echo ""
echo "  GitHub: https://github.com/unseeng33k/amp-agency-system"
echo ""
