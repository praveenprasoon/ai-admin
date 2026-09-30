#!/bin/bash
# -----------------------------------------------------------------------------
# Portfolio Intelligence Dashboard - Automated Workspace Scaffolder
# Bypasses internal library asset bugs by bootstrapping local spec templates
# -----------------------------------------------------------------------------

echo "🚀 Initializing your Spec-Driven Multi-Root Monorepo..."

# 1. Create Required Subdirectories
mkdir -p .specify
mkdir -p .github
mkdir -p backend-pipeline
mkdir -p frontend-dashboard

# 2. Generate multi-root VS Code workspace file
cat << 'EOF' > portfolio.code-workspace
{
  "folders": [
    {
      "name": "⚓ CORE SPEC (Read-Only Contract)",
      "path": ".specify"
    },
    {
      "name": "⚙️ BACKEND DATA PIPELINE",
      "path": "backend-pipeline"
    },
    {
      "name": "📊 FRONTEND REACT UI",
      "path": "frontend-dashboard"
    }
  ],
  "settings": {
    "files.exclude": {
      "**/.git": true,
      "**/.DS_Store": true,
      "**/node_modules": true,
      "**/.venv": true
    }
  }
}
EOF

# 3. Generate Project Constitution & Token Guardrails
cat << 'EOF' > .specify/constitution.md
# Project Constitution: Portfolio Intelligence

## Tech Stack Boundaries
- **Backend Infrastructure:** Python 3.14 + FastAPI + Unstructured.io (for parsing PPTX, XLSX, EML files)
- **Frontend Dashboard:** Next.js (App Router) + Tailwind CSS + Shadcn/ui
- **State & AI Engine:** LangGraph (Stateful Agent Router) + Amazon Bedrock (Claude 4.8 / Auto Mode)

## Token Allocation & Budget Guardrails (Targeting <$2k/mo Limit)
- **Code Generation Protocol:** Under no circumstances should you rewrite entire source files. Output *only* updated functions or modified code fragments.
- **Dependency Isolation:** Never scan the frontend folders when writing backend code, or vice-versa.
- **Cache Optimization:** Keep immutable configurations at the absolute top of the conversation context to hit Anthropic's 90% prompt caching discount.
EOF

# 4. Generate Root-Level Copilot Instructions Context Router
cat << 'EOF' > .github/copilot-instructions.md
# System Context Routing Rules & Workspace Guardrails

## 1. Context Locking Protocol
You are an advanced Enterprise Multi-Project Assistant. To optimize token expenditures and avoid cross-project pollution, you must strictly jail your file-scanning scope when user intent narrows to a single project:
- If the prompt matches **"xyz"** or **"project xyz"** ➔ Sandbox your execution strictly inside `/project-xyz/meetings/`. Ignore all root dependencies, portfolio architectures, or frontend layouts.
- If the prompt matches **"portfolio"** ➔ Align exclusively to `/portfolio-intelligence/` using `.specify/contract.json` as your absolute boundary guide.

## 2. Code Generation Protocol
- **No Token Bloat:** Do not generate massive blocks of boilerplate or duplicate unedited code. Provide highly surgical diffs.
- **Isolated Sandboxes:** Treat `backend-pipeline` and `frontend-dashboard` as fully distinct workspaces. Do not cross-contaminate their configurations.
EOF

# 5. Generate Master Data Contract Schema
cat << 'EOF' > .specify/contract.json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "PortfolioStatePayload",
  "description": "Unified data contract mapping 200+ resources, Jira milestones, and security logs.",
  "type": "object",
  "required": ["portfolio_id", "last_updated", "programs", "resources", "cross_program_risks"],
  "properties": {
    "portfolio_id": { "type": "string" },
    "last_updated": { "type": "string", "format": "date-time" },
    "programs": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["program_id", "name", "jira_align_initiative", "milestones", "security_posture"],
        "properties": {
          "program_id": { "type": "string" },
          "name": { "type": "string" },
          "jira_align_initiative": { "type": "string" },
          "milestones": {
            "type": "array",
            "items": {
              "type": "object",
              "required": ["id", "name", "target_date", "status", "dependencies"],
              "properties": {
                "id": { "type": "string" },
                "name": { "type": "string" },
                "target_date": { "type": "string", "format": "date" },
                "status": { "type": "string", "enum": ["ON_TRACK", "AT_RISK", "DELAYED", "COMPLETE"] },
                "dependencies": { "type": "array", "items": { "type": "string" } }
              }
            }
          },
          "security_posture": {
            "type": "object",
            "required": ["snyk_critical_count", "snyk_high_count"],
            "properties": {
              "snyk_critical_count": { "type": "integer" },
              "snyk_high_count": { "type": "integer" }
            }
          }
        }
      }
    },
    "resources": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["resource_id", "name", "role", "total_allocation_percentage", "assignments"],
        "properties": {
          "resource_id": { "type": "string" },
          "name": { "type": "string" },
          "role": { "type": "string" },
          "total_allocation_percentage": { "type": "integer" },
          "assignments": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "program_id": { "type": "string" },
                "allocation": { "type": "integer" }
              }
            }
          }
        }
      }
    },
    "cross_program_risks": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["risk_id", "source_type", "summary", "severity"],
        "properties": {
          "risk_id": { "type": "string" },
          "source_type": { "type": "string", "enum": ["JIRA_ALIGN", "EMAIL_STATUS", "PPTX_DECK", "SNYK"] },
          "summary": { "type": "string" },
          "severity": { "type": "string", "enum": ["CRITICAL", "HIGH", "MEDIUM", "LOW"] }
        }
      }
    }
  }
}
EOF

# 6. Generate Global .copilotignore
cat << 'EOF' > .copilotignore
node_modules/
.venv/
.next/
dist/
build/
package-lock.json
yarn.lock
poetry.lock
**/*.mp4
**/zoom_transcripts/
EOF

chmod +x portfolio.code-workspace

echo "✅ Multi-root monorepo structure successfully scaffolded!"
echo "👉 Open the 'portfolio.code-workspace' file in VS Code to launch your dual-agent workspace."
