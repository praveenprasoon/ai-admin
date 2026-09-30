Here is your file: user_guide_parallel_agents.md.
This document contains a complete, step-by-step user guide written specifically for engineers who have no prior experience with AI agents. It breaks down exactly how to operate your split-screen VS Code workspace, how to prompt the isolated chats, and how to verify that your agents aren't wasting tokens beneath your $2,000 monthly ceiling.
Step 1: Initialize Your Workspace
1. Run your setup_workspace.sh script to auto-generate all directories and contract files.
2. In VS Code, go to File > Open Workspace from File... and select portfolio.code-workspace from your root folder.
3. Your sidebar will now show three isolated, sandboxed folders side-by-side in a single window.
Step 2: Open and Align Your Dual Chat Windows
To drive two developers in parallel without them crossing wires, configure your interface like this:
1. Click the GitHub Copilot Chat icon in your left sidebar to open the chat panel.
2. Click the ... menu at the top right of that Chat panel and select "Open Chat in Editor". This moves the chat into a standard central tab.
3. Right-click that new Chat tab and select "Split Right".
4. Click the "+" (New Chat) icon on both the left and right windows. This guarantees they have fresh, non-overlapping history tracks.
5. In the dropdown at the bottom of both chat inputs, ensure the model selection is set to Auto (this lets the system automatically pick cheap models for simple code and upscale to Claude Opus 4.8 for heavy architecture loops).
Step 3: Prompting the Parallel Tracks
Now, treat the left chat window as your Backend Python Developer and the right window as your Frontend React Developer. Paste these exact prompts into their respective boxes:
⚙️ In Chat Window 1 (Left Screen — For Backend Pipeline):
Prompt: #file:../.specify/contract.json I am assigning you to build the data processing track inside the backend-pipeline/ folder. Look at this attached contract schema. Write a complete Python FastAPI application inside backend-pipeline/app.py that loads our mock data, exposes a GET /api/v1/portfolio/stream endpoint, and validates the output structure perfectly against this contract. Do not look at, write to, or scan the frontend folder.
📊 In Chat Window 2 (Right Screen — For Frontend UI):
Prompt: #file:../.specify/contract.json #file:../.specify/mock_payload.json I am assigning you to build the UI visualization track inside the frontend-dashboard/ folder. Look at the attached contract and mock data. Generate a beautiful Next.js page inside frontend-dashboard/src/app/page.tsx using Tailwind CSS. Build a responsive layout grid that displays our milestone timeline and highlights any human resources whose total_allocation_percentage is over 100%. Use the mock file directly to hydrate the page. Do not look at or write to the backend folder.
Step 4: Tracking Your Progress and Token Ceiling
Because you attached only the specific contract files rather than typing @workspace, your input footprint remains incredibly small. Each prompt will safely hit Copilot's built-in 90% prompt caching layer, ensuring your active development stays well below your monthly budget.
• To monitor this in real-time, open your VS Code terminal panel, switch the channel tab from Terminal to Output, and select GitHub Copilot Chat from the right-hand dropdown menu. You will see lines showing cache_read_tokens, confirming that you are getting your enterprise discount on every subsequent question!
Now that your step-by-step parallel blueprint guide is completed, would you like to generate a sample unstructured Zoom AI text notes file so you can test your inline text context router (clean notes for project xyz) right now?
