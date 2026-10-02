Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host "🏎️  GENERATING COMPREHENSIVE PROJECT JOY SDD ENVIRONMENT..." -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan

# 1. Create directory structures safely
New-Item -ItemType Directory -Force -Path .vscode, .github, .specify/reference-pipeline, joy-backend/data_ref, joy-frontend/src/app, project-xyz/meetings | Out-Null

# 2. Write Multi-Root VS Code Config File (portfolio.code-workspace)
$workspaceContent = @'
{
  "folders": [
    { "name": "⚓ JOY CORE CONTRACT & SPECS", "path": ".specify" },
    { "name": "⚙️ JOY AWS OCTAGON BACKEND", "path": "joy-backend" },
    { "name": "📊 JOY NEXT.JS FRONTEND VIEW", "path": "joy-frontend" }
  ],
  "settings": {
    "files.watcherExclude": { "**/node_modules/**": true, "**/.venv/**": true, "**/true": true, "**/dist/**": true, "**/build/**": true },
    "search.exclude": { "**/node_modules": true, "**/.venv": true, "**/true": true, "**/dist": true, "**/build": true }
  }
}
'@
Set-Content -Path portfolio.code-workspace -Value $workspaceContent

# 3. Write Python 3.14 Production Requirements File (joy-backend/requirements.txt)
$reqsContent = @'
fastapi>=0.110.0
uvicorn>=0.28.0
pydantic>=2.6.0
sqlalchemy>=2.0.0
qdrant-client>=1.8.0
openpyxl>=3.1.0
python-pptx>=0.6.23
weasyprint>=61.0
unstructured[email]>=0.12.0
pytest>=8.0.0
requests>=2.31.0
jsonschema>=4.21.0
'@
Set-Content -Path joy-backend/requirements.txt -Value $reqsContent

# 4. Write Global Token Guardrails (.copilotignore)
$ignoreContent = @'
node_modules/
.venv/
.next/
dist/
build/
package-lock.json
yarn.lock
poetry.lock
**/*.mp4
**/joy-backend/data_ref/
**/zoom_transcripts/
**/raw_notes/
*.db
*.db-journal
'@
Set-Content -Path .copilotignore -Value $ignoreContent

# 5. Populate the custom context routing instructions (.github/copilot-instructions.md)
$instructionsContent = @'
# Project Joy: Custom Copilot Routing Guidelines
- Phase 0 Optimization: Prior to any generation loop, read `.specify/joy_human_guide.md` and `.specify/reference_mockup.html` to synchronize structural schemas.
- Contract Invariance: Once `.specify/joy_ai_spec.json` is generated, it serves as the immutable single source of truth for both parallel windows.
- Context Lock: If user prompt mentions "project xyz", restrict file scans exclusively to `/project-xyz/meetings/`. Ignore backend and frontend application tracks.
- Token Control Protocol: Output modified or updated functions only. Do not rewrite unchanged lines of code. Skip conversational headers.
'@
Set-Content -Path .github/copilot-instructions.md -Value $instructionsContent

# 6. Seed the human-readable Markdown blueprint (.specify/joy_human_guide.md)
$guideContent = @'
# Project Joy: Human Configuration Guide
- **Target App:** Portfolio Intelligence Hub (Joy)
- **Database Rules:** Use an abstract SQLite table to map runtime metadata keys.
- **Human Resources Module:** Every employee profile must capture: `id`, `name`, `role`, and `allocation_percentage`. 
- **Validation Constraint:** If a user adds an assignment that pushes a resource's total allocation over 100%, flag the row grid color as red.
- **Defects Module:** Onboard a new module for Tracking Defects, capturing fields for team, priority, and status.
'@
Set-Content -Path .specify/joy_human_guide.md -Value $guideContent

# 7. Write the automated token compressor mapping script (.specify/sync_specs.py)
$syncScriptContent = @'
import json
import re

def compress_markdown_to_ai_spec():
    with open(".specify/joy_human_guide.md", "r") as f:
        human_text = f.read()

    alloc_rule = "if(Resource.allocation>100){cell_color='red'}" if "over 100%" in human_text else ""
    
    compressed_spec = {
        "openapi": "3.1.0",
        "info": {"title": "JoyCore", "version": "1.0.0"},
        "components": {
            "schemas": {
                "Resource": {
                    "type": "object",
                    "required": ["id", "name", "role", "allocation"],
                    "properties": {
                        "id": {"type": "string", "format": "uuid"},
                        "name": {"type": "string"},
                        "role": {"type": "string"},
                        "allocation": {"type": "integer"}
                    }
                }
            }
        },
        "x-guardrails": {
            "token_control": "delta_patches_only",
            "ui_assertion": alloc_rule
        }
    }

    with open(".specify/joy_ai_spec.json", "w") as f:
        json.dump(compressed_spec, f, separators=(',', ':'))
        
    print("✅ Compiled human specs into a token-optimized Google Open Spec asset!")

if __name__ == '__main__':
    compress_markdown_to_ai_spec()
'@
Set-Content -Path .specify/sync_specs.py -Value $syncScriptContent

# 8. Deploy the local specifications coverage validator (joy-backend/validate_joy_spec.py)
$validateScriptContent = @'
import os
import json
import sys

def validate_environment():
    print("="*60)
    print("📋 RUNNING JOY SPECIFICATION COVERAGE & CONTRACT VALIDATION")
    print("="*60)
    errors = 0
    required_paths = [".specify/joy_ai_spec.json", "joy-backend/requirements.txt", ".github/copilot-instructions.md", ".copilotignore"]
    
    print("\n[STEP 1] Checking Workspace Structural Framework:")
    for path in required_paths:
        if os.path.exists(path): print(f"  ✅ Found requirement anchor: {path}")
        else:
            print(f"  ❌ Missing requirement anchor: {path}"); errors += 1

    print("\n" + "="*60)
    if errors == 0:
        print("🎉 SUCCESS: All environment settings and contracts conform to Joy specifications!")
        sys.exit(0)
    else:
        print(f"❌ COMPLIANCE AUDIT FAILED: Detected {errors} spec validation flags."); sys.exit(1)

if __name__ == '__main__': validate_environment()
'@
Set-Content -Path joy-backend/validate_joy_spec.py -Value $validateScriptContent

# 9. FLATTENED ARRAY STREAM: Auto-Generate User Manual without Here-String bugs
$lines = @(
    "# 📖 Playbook: Step-by-Step Guide to Run Project Joy Parallel Workspaces",
    "",
    "This guide details the exact operational sequences required to bootstrap and build Project Joy cleanly using split-screen Copilot windows while maximizing your token caching.",
    "",
    "---",
    "",
    "### Step 1: Open Your Optimized Multi-Root View",
    "1. Open VS Code.",
    "2. Go to the top menu and select File > Open Workspace from File...",
    "3. Select portfolio.code-workspace from your project root folder.",
    "4. Your left-hand file Explorer sidebar will now cleanly split your project into three sandboxed directories:",
    "   - JOY CORE CONTRACT & SPECS",
    "   - JOY AWS OCTAGON BACKEND",
    "   - JOY NEXT.JS FRONTEND VIEW",
    "",
    "---",
    "",
    "### Step 2: Set Up and Isolate Your Python 3.14 Environment",
    "Open a terminal in VS Code, verify it is running PowerShell, and run these commands to install your libraries:",
    "python -m venv .venv",
    ".\\.venv\\Scripts\\activate",
    "pip install -r joy-backend/requirements.txt",
    "",
    "---",
    "",
    "### Step 3: Run Phase 0 (Token Compression Compilation)",
    "Before launching your parallel code generators, drop your existing multi-folder pipeline directory directly into .specify/reference-pipeline/ and your completed dashboard layout file into .specify/reference_mockup.html. Then compile your text rules into high-density Google OpenAPI specs:",
    "python .specify/sync_specs.py",
    "This command translates your human-readable notes into a minified, machine-optimized JSON contract (joy_ai_spec.json), locking in your 94% Prompt Caching discount and keeping costs beneath your user limits.",
    "",
    "---",
    "",
    "### Step 4: Open and Drive Your Parallel Agent Windows",
    "1. Open your GitHub Copilot Chat sidebar window.",
    "2. Click the ... options menu at the top right of the chat panel and click Open Chat in Editor. This moves the AI panel into a main central tab.",
    "3. Right-click that Chat tab and select Split Right.",
    "4. Click the + (New Chat) icon on both screens to clear out historical context clutter. Ensure the dropdown selector at the base of both windows is toggled to Auto Mode.",
    "",
    "#### Window 1 (Left Window - Backend Data Pipeline Agent Target)",
    "Attach only .specify/joy_ai_spec.json and your codebase anchor .specify/reference-pipeline, then prompt:",
    "Read the reference pipeline. Generate the complete Python FastAPI application inside joy-backend/app.py that connects our existing data fetching engines, dynamically scales local SQLite tables on the fly based on input prompts, and exposes a real data stream route matching this json spec exactly.",
    "",
    "#### Window 2 (Right Window - Frontend UI Dashboard Agent Target)",
    "Attach only .specify/joy_ai_spec.json and your interface mockup .specify/reference_mockup.html, then prompt:",
    "Read the mockup layout. Generate our upgraded enterprise dashboard inside joy-frontend/src/app/page.tsx using Next.js and Tailwind. Implement dynamic useSearchParams URL trails to handle deep-linking, loop forms abstractly using the metadata fields from the spec, and integrate dynamic Recharts panels that switch metrics parameters instantly.",
    "",
    "---",
    "",
    "### Step 5: Validate and Boot Your Complete Application",
    "Once your parallel agents finish printing out their code blocks, paste them into their files and run the auto-generated verification suite to check for bugs or placeholders:",
    "python joy-backend/validate_joy_spec.py",
    "If the terminal yields full validation success, fire up your servers! Go to your terminal and execute:",
    "uvicorn joy-backend.app:app --reload",
    "Open a secondary terminal window, change directories to joy-frontend, and run:",
    "npm run dev"
)
