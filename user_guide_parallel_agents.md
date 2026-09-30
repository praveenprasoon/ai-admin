# Step-by-Step Guide: Parallel Multi-Agent Software Development
This comprehensive guide is designed for engineering teams and managers with **no prior experience using AI agents**. It walks through configuring a single VS Code window into a dual-track parallel coding station while staying well under a **$2,000 monthly enterprise token ceiling**.

---

## 🏗️ Phase 1: Creating the Automation Infrastructure

Before launching your parallel developers, you need to set up the workspace folders and the shared API contract. This ensures the backend agent and frontend agent can build toward the same data boundaries without overwriting each other's code.

### Step 1: Run the Automation Scaffolding Script
1. Create a blank directory on your local machine named `portfolio-intelligence-workspace`.
2. Move your `setup_workspace.sh` file into this directory.
3. Open your terminal, navigate to the directory, and execute the script:
   ```bash
   chmod +x setup_workspace.sh
   ./setup_workspace.sh
   ```
4. This instantly generates your folder structures, token optimization guardrails, custom instructions, and the core `contract.json` layout.

### Step 2: Open the Multi-Root Workspace in VS Code
1. Open a single window of VS Code.
2. Go to the top menu and select **File > Open Workspace from File...**
3. Select the newly generated **`portfolio.code-workspace`** file from your root folder.
4. Look at your left sidebar panel. It will neatly display three sandboxed folders side-by-side in a single view:
   * ⚓ `CORE SPEC (Read-Only Contract)`
   * ⚙️ `BACKEND DATA PIPELINE`
   * 📊 `FRONTEND REACT UI`

---

## 🏎️ Phase 2: Configuring Parallel Chat Windows

To drive two developer tracks concurrently without mixing conversation histories, split your screen into two completely isolated chat boundaries.

```
 ── VS CODE SPLIT LAYOUT ────────────────────────────────────────────────────
│  EXPLORER    │  [💻 CHAT WINDOW 1 - LEFT]   │  [💻 CHAT WINDOW 2 - RIGHT]  │
│ 📁 SPEC      │  Targeting: backend-pipeline  │  Targeting: frontend-dashboard│
│ 📁 BACKEND   │                              │                              │
│ 📁 FRONTEND  │  User: "Build FastAPI based  │  User: "Build React layout   │
│              │  on contract.json..."        │  based on contract.json..."  │
 ────────────────────────────────────────────────────────────────────────────
```

### Step-by-Step Layout Split:
1. Click the **GitHub Copilot Chat** icon in your left sidebar to open the baseline chat panel.
2. Click the `...` menu at the top right corner of that Chat panel and select **"Open Chat in Editor"**. This moves the chat interface into a central tab alongside your code.
3. Right-click that new Chat tab and select **"Split Right"**. 
4. Click the **"+" (New Chat)** icon on both the left and right windows. This guarantees they have fresh, non-overlapping history tracks.
5. In the dropdown at the bottom of **both** chat inputs, ensure the model selection is set to **Auto**. This allows Copilot to dynamically route simple styling requests to cheaper models while upscaling to premium compute like **Claude Opus 4.8** for heavy architecture loops.

---

## 🚀 Phase 3: Prompting and Driving Your Agents

Now that your workspace is split, treat the left chat window as your **Backend Python Developer** and the right chat window as your **Frontend React Developer**. Copy and paste these exact prompts to kick off generation simultaneously:

### ⚙️ Left Chat Window (For Backend Pipeline Agent)
```text
#file:../.specify/contract.json 
I am assigning you to build the data processing track inside the `backend-pipeline/` folder. Look at this attached contract schema. Write a complete Python FastAPI application inside `backend-pipeline/app.py` that loads our mock data, exposes a `GET /api/v1/portfolio/stream` endpoint, and validates the output structure perfectly against this contract. Do not look at, write to, or scan the frontend folder.
```

### 📊 Right Chat Window (For Frontend UI Agent)
```text
#file:../.specify/contract.json 
#file:../.specify/mock_payload.json 
I am assigning you to build the UI visualization track inside the `frontend-dashboard/` folder. Look at the attached contract and mock data. Generate a beautiful Next.js page inside `frontend-dashboard/src/app/page.tsx` using Tailwind CSS. Build a responsive layout grid that displays our milestone timeline and highlights any human resources whose `total_allocation_percentage` is over 100%. Use the mock file directly to hydrate the page. Do not look at or write to the backend folder.
```

---

## 🛡️ Phase 4: Token Optimization & Inline Context Switching

Your workspace has built-in guardrails to protect your **$2,000 monthly user token ceiling**. By attaching specific files via the `#` handle instead of typing wide-scope instructions like `@workspace`, your prompt footprint remains minimal and locks into a **90% cost-saving prompt caching discount**.

### Working with Context Changes (Zoom Notes & Sub-Projects)
Your system contains an active context router (`.github/copilot-instructions.md`). This allows you to open a new chat window and switch project alignments instantly without loading heavy background data.

*   **Task A: Clean Meeting Notes for Project XYZ**
    *   *Prompt:* `"clean notes for project xyz and summarize key decisions"`
    *   *AI Action:* The background router catches the word "xyz", ignores your heavy backend code, locks its vision exclusively into `/project-xyz/meetings/`, and processes your text using highly cost-efficient tokens.
*   **Task B: Generate HTML Specifications**
    *   *Prompt:* `"Read #file:requirements.md and generate a standalone HTML spec sheet"`
    *   *AI Action:* The agent builds a lightweight document directly from the specified file without scanning outside code directories.

### Verification of Token Savings:
To verify that your workspace is successfully executing your enterprise cache discounts in real-time:
1. Open the terminal panel in VS Code (`Cmd + \`` or `Ctrl + \``).
2. Switch the panel tab channel from *Terminal* to **Output**.
3. Select **GitHub Copilot Chat** from the right-hand dropdown selection menu.
4. Review the raw API logs during any prompt run. You will see metrics tracking `cache_read_tokens`, confirming your code is running on cached memory and maintaining an optimal financial footprint!