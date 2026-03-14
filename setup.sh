#!/bin/bash

# AMP Agency System — Setup Script
# Runs on Mac and Linux. Takes 2 minutes.

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # no color

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     AMP Agency System — Setup            ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
echo ""

# Get the directory where this script lives
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${GREEN}Found system at:${NC} $SCRIPT_DIR"
echo ""

# ── Step 1: Set VAULT_ROOT ────────────────────────────────────────────────────
echo -e "${YELLOW}Step 1 of 3 — Where did you put this folder?${NC}"
echo "  (Press Enter to use the current location)"
echo ""
read -p "  Path [$SCRIPT_DIR]: " VAULT_ROOT
VAULT_ROOT="${VAULT_ROOT:-$SCRIPT_DIR}"

PROJECTS_ROOT="$VAULT_ROOT/projects"
SKILLS_PATH="$VAULT_ROOT/resources/skills"

echo ""
echo -e "  Using:"
echo -e "    VAULT_ROOT:    $VAULT_ROOT"
echo -e "    PROJECTS_ROOT: $PROJECTS_ROOT"
echo -e "    SKILLS_PATH:   $SKILLS_PATH"
echo ""

# ── Step 2: Create folders ────────────────────────────────────────────────────
echo -e "${YELLOW}Step 2 of 3 — Creating project folders...${NC}"
mkdir -p "$PROJECTS_ROOT/clients"
mkdir -p "$VAULT_ROOT/resources/skills"
echo -e "  ${GREEN}✓${NC} projects/ folder ready"
echo -e "  ${GREEN}✓${NC} resources/ folder ready"
echo ""

# ── Step 3: Write paths into SYSTEM-PROMPT.md ─────────────────────────────────
echo -e "${YELLOW}Step 3 of 3 — Configuring SYSTEM-PROMPT.md...${NC}"

SYSTEM_PROMPT="$VAULT_ROOT/agents/SYSTEM-PROMPT.md"

if [ ! -f "$SYSTEM_PROMPT" ]; then
  echo "  ✗ Could not find agents/SYSTEM-PROMPT.md"
  echo "    Make sure you're running this from inside the amp-agency-system folder."
  exit 1
fi

# Replace placeholders — works on both macOS and Linux
sed -i.bak \
  -e "s|\[VAULT_ROOT\]|$VAULT_ROOT|g" \
  -e "s|\[PROJECTS_ROOT\]|$PROJECTS_ROOT|g" \
  -e "s|\[SKILLS_PATH\]|$SKILLS_PATH|g" \
  "$SYSTEM_PROMPT"

# Also update SKILL-DISCOVERY-PROTOCOL
SDP="$VAULT_ROOT/agents/SKILL-DISCOVERY-PROTOCOL.md"
if [ -f "$SDP" ]; then
  sed -i.bak \
    -e "s|\[VAULT_ROOT\]|$VAULT_ROOT|g" \
    -e "s|\[SKILLS_PATH\]|$SKILLS_PATH|g" \
    -e "s|\[API_KEYS_PATH\]|$VAULT_ROOT/resources/api-keys.md|g" \
    "$SDP"
fi

# Update STARTER-PROMPT.md
STARTER="$VAULT_ROOT/STARTER-PROMPT.md"
if [ -f "$STARTER" ]; then
  sed -i.bak \
    -e "s|\[VAULT_ROOT\]|$VAULT_ROOT|g" \
    -e "s|\[PROJECTS_ROOT\]|$PROJECTS_ROOT|g" \
    "$STARTER"
fi

# Clean up .bak files
find "$VAULT_ROOT/agents" -name "*.bak" -delete 2>/dev/null
find "$VAULT_ROOT" -maxdepth 1 -name "*.bak" -delete 2>/dev/null

echo -e "  ${GREEN}✓${NC} Paths written into SYSTEM-PROMPT.md"
echo -e "  ${GREEN}✓${NC} Paths written into SKILL-DISCOVERY-PROTOCOL.md"
echo -e "  ${GREEN}✓${NC} Paths written into STARTER-PROMPT.md"
echo ""

# ── Step 4: Create api-keys.md if it doesn't exist ────────────────────────────
API_KEYS="$VAULT_ROOT/resources/api-keys.md"
API_TEMPLATE="$VAULT_ROOT/resources/api-keys-template.md"

if [ ! -f "$API_KEYS" ] && [ -f "$API_TEMPLATE" ]; then
  cp "$API_TEMPLATE" "$API_KEYS"
  echo -e "  ${GREEN}✓${NC} Created resources/api-keys.md from template"
  echo -e "    ${YELLOW}→ Open it and fill in whatever API keys you have${NC}"
  echo ""
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo -e "${GREEN}╔══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Setup complete!                      ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${YELLOW}What to do next:${NC}"
echo ""
echo -e "  2. ${BLUE}Add your API keys${NC}"
echo -e "     Open: $VAULT_ROOT/resources/api-keys.md"
echo -e "     Fill in whatever keys you have. Skip any you don't."
echo ""
echo -e "     To make keys available to skill scripts, add this to your ~/.zshrc or ~/.bashrc:"
echo -e "     ${BLUE}export AMP_API_KEYS_PATH=\"$VAULT_ROOT/resources/api-keys.md\"${NC}"
echo ""
echo -e "  2. ${BLUE}Paste the starter prompt into your AI${NC}"
echo -e "     Open: $VAULT_ROOT/STARTER-PROMPT.md"
echo -e "     Copy the entire file. Paste as your first message."
echo ""
echo -e "  3. ${BLUE}Give it a brief${NC}"
echo -e "     Say: \"I need to run a campaign for [client] to [objective].\""
echo ""
echo -e "  GitHub: https://github.com/unseeng33k/amp-agency-system"
echo ""
