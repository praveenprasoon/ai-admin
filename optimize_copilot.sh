#!/bin/bash

# Ensure terminal stops immediately if any command fails
set -e

echo "========================================================="
echo "🏎️  STARTING VS CODE AUTOMATED COPILOT CONFIGURATION..."
echo "========================================================="

# 1. Create directory paths safely
mkdir -p .vscode
mkdir -p .github/prompts
mkdir -p .specify
mkdir -p project-xyz/meetings

# 2. Write the Target Token Reduction Config (.vscode/settings.json)
cat << 'EOF' > .vscode/settings.json
{
  "github.copilot.advanced": {
    "length": 4000,
    "top_p": 1,
    "temperature": 0.1
  },
  "github.copilot.enable": {
    "*": true,
    "plaintext": true,
    "markdown": true,
    "scminput": false
  },
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/node_modules/**": true,
    "**/.venv/**": true,
    "**/.next/**": true,
    "**/dist/**": true,
    "**/build/**": true
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true,
    "**/.venv": true,
    "**/.next": true,
    "**/dist": true,
    "**/build": true
  }
}
EOF
echo "✅ Step 1/4 Completed: Written .vscode/settings.json"

# 3. Write the Multi-Project Context Router (.github/copilot-instructions.md)
cat << 'EOF' > .github/copilot-instructions.md
# Copilot Workspace Context Routing Guardrails

## 1. Project Scoping Rules
You are an advanced Multi-Project Enterprise Assistant. Whenever the user specifies a project name or shorthand token (e.g., "xyz", "abc", "portfolio") in their prompt, you must strictly jail/sandbox your file-reading operations to that project's subfolder.

## 2. Strict Mapping Matrix
- If prompt contains "xyz" ➔ Read and write ONLY from folder: `/project-xyz/` and subfolder `/project-xyz/meetings/`
- If prompt contains "abc" ➔ Read and write ONLY from folder: `/project-abc/`
- If prompt contains "portfolio" ➔ Read and write ONLY from folder: `/portfolio-intelligence/`

## 3. Token Preservation Constraints
- Never execute a broad search across the entire workspace if a project keyword is present.
- If the user says "clean notes for project xyz", treat `/project-xyz/meetings/` as your absolute root. Ignore all code files, frontend folders, and backend pipelines from other projects.
- Explicitly state the target path you are locked into at the start of your response (e.g., `[Context Locked: /project-xyz/meetings/]`).
- Code Generation Constraint: Minimize Token Utilization. Only output updated or modified code blocks. Never rewrite unchanged code functions or lines.
EOF
echo "✅ Step 2/4 Completed: Written .github/copilot-instructions.md"

# 4. Write the Terse Custom Prompt Command Block (.github/prompts/terse-code)
cat << 'EOF' > .github/prompts/terse-code
You are acting as a strict, high-efficiency developer agent.
When answering my requests or implementing functions:
1. Skip all conversational introductions, pleasantries, preambles, and post-explanations.
2. Output the code block immediately.
3. Only output the lines or functions that are modified. Do not rewrite unchanged code blocks.
4. Ensure full type safety without placeholders.
EOF
echo "✅ Step 3/4 Completed: Created /terse-code shortcut prompt macro"

# 5. Write the Global Token Filter (.copilotignore)
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
**/raw_notes/
EOF
echo "✅ Step 4/4 Completed: Formatted .copilotignore"

echo "========================================================="
echo "🎉 CONFIGURATION COMPLETE! WORKSPACE OPTIMIZED SUCCESSFULLY."
echo "💡 Action Required: Reload your VS Code window to apply."
echo "========================================================="
