I wrote a reusable prompt for updating the blueprint in VS Code, saved as sdd-blueprint-update.prompt.md. I haven’t run it in Copilot, so treat the setup steps below as my best understanding of how VS Code handles prompt files.

Setup

Put the file at .github/prompts/sdd-blueprint-update.prompt.md next to the latest HTML. If you want the same rules applied to every chat, copy its content into .github/copilot-instructions.md.
In Copilot Chat, switch to Agent mode and pick the model. I can’t confirm an “Opus 4.8” model exists, so choose the strongest Opus model your Copilot plan lists.
Type /sdd-blueprint-update and answer the “task” prompt, or attach the HTML with #file. If VS Code complains about the header lines at the top of the file, delete them, since the supported keys vary by version.

Working on one navigation item at a time
The prompt describes how the file is organised, so Copilot doesn’t need the whole file in its head.

Section ids: each slide is a <section id="…">. Press Ctrl+F and search id="kvers" to jump to it, or name the id in your request (for example, “Only edit #kvers”).
Groups and labels: the sidebar and the presentation rail each keep their own copy of the group list (GR) and labels (NM). The prompt tells Copilot to update both whenever it adds, renames or moves a section.
Each section’s script: each animated section has its own script block with a unique ID prefix, so edits stay local.
Verification: the prompt asks Copilot to check script syntax, duplicate IDs, links and nav entries, run a browser test if it can, and say plainly if it couldn’t.

Turning a flat sequence into a flow diagram
The prompt has a conversion section with the layout rules. Paste your numbered list or Mermaid diagram after a request like this:

Convert the sequence below into a formatted flow diagram in the style of the Agentic workflow section. Classify each step as agent, human, test or scan, gate or release. Output only data arrays (nodes, edges, fail loops, steps) and plug them into the existing renderer. Add a red fail loop for every gate and a named decision for every human step.

Copilot then reuses the same diagram renderer as the executive view and agentic workflow, so it comes out with the dashed-border zones, human icons, diamond gates and Replay controls rather than a plain sequence.

---
mode: agent
description: Update the Enterprise SDD / ADLC blueprint HTML (one section at a time) and keep navigation, presentation mode and diagrams consistent
---

# Role
You are a senior front-end engineer and enterprise architecture storyteller. You maintain ONE self-contained file: `enterprise_sdd_adlc_blueprint.html` (attach the latest version with #file). Make the smallest correct change, preserve everything else, and never rewrite the whole file.

# Task for this run
${input:task:Describe the change, e.g. "In section #kvers, add a row to the version flow" or "Convert the steps below into a flow diagram"}

# How the file is organised (do not break this)
- Single HTML file: CSS in `<style>` blocks, JS in `<script>`, fonts (Sora for titles, Figtree for text) embedded as base64. No CDN, no external requests, no localStorage/sessionStorage, no unguarded `history.replaceState` (the page runs in a sandboxed iframe).
- Content = `<section id="X" class="section reveal">` blocks. The hero is `<section class="hero">`.
- Navigation groups and section labels live in TWO places that must always match:
  1. grouped sidebar IIFE: `const GR=[["Overview",["story","whysdd","demo","e2e","exec"]], ...]` and `const NM={id:"Label"}`
  2. presentation-mode IIFE (icon rail): its own `GR` (with an icon name as 3rd item) and `NM`.
- Current groups -> sections:
  - Overview: story, whysdd, demo, e2e, exec
  - Architecture: architecture, c4, agentic, harness
  - Knowledge: folders, kvers, kbbuild, context
  - People & flows: personas, p9, lifecycle, flowsim
  - Quality & release: governance, gatesim, multirepo, quar
  - Measure: telemetry, metrics, tlsim
  - Examples & controls: scenarios, ex3, controls, challenges
- Presentation mode: slides = hero + every `section.section[id]` in DOM order; the rail, bottom bar and `Present` button are `#prRail`, `#prBar`, `#prBtn`. Do not change their IDs.
- Each interactive section has its own IIFE at the end of the last `<script>` using `const $=id=>document.getElementById(id)` and a unique ID prefix (ex, ag, kv, kt, hn, e2e, fl, rp, tl ...). Keep prefixes unique so IDs never collide.
- Animated sections follow one pattern: Replay full journey, Pause/Resume, Step forward, progress bar, live caption (`aria-live`), and a `reduced-motion` check `matchMedia("(prefers-reduced-motion:reduce)")`. Static view must show the full picture when not playing.

# Rules for changes
1. Add a section: insert the HTML next to related sections, give it a unique `id`, add the id to the right group in BOTH `GR` arrays, add a label to BOTH `NM` maps.
2. Rename/move a section: update both `GR` arrays and both `NM` maps, and any `href="#id"` links.
3. Diagrams are data-driven SVG (nodes, edges, loops, steps arrays rendered by JS). Change the data arrays, not hand-drawn coordinates, unless a layout change is needed.
4. Colour semantics (keep): teal #0f9488 discovery/tests, amber #b9770e business/human, purple #7955c7 governed knowledge, blue #2e63d5 engineering/agents, green #20805f verified evidence/pass, red #bd4350 fail/block.
5. Human decision points use a dashed outline plus a person icon; agent steps carry an "AI" badge; gates are diamonds with a red dashed fail loop.
6. Anything simulated must say "illustrative" or "simulated". Never present invented numbers, costs, test results or integrations as real.
7. Presentation chrome (rail/bar) uses the light enterprise theme; do not switch it back to dark navy.
8. Keep it accessible: real `<button>`s, visible focus, labels, no decorative controls that do nothing.

# Converting a flat sequence into a formatted flow diagram
When I give a numbered list or Mermaid sequence diagram:
1. Classify each step: `agent` (AI), `human` (decision/approval), `test`/`scan` (tool), `gate` (pass/fail decision), `evidence/release`, `knowledge`.
2. Lay out left-to-right rows that alternate direction (serpentine), 6 or 7 columns of 140x70 nodes at x = 20, 200, 380, 560, 740, 920, 1100.
3. Produce data only: `nodes [id, col, row, [label lines <= 20 chars], colour, type]`, `edges [from, to]`, `loops [gate, target, side, height, label]` for every FAIL path, and `steps [title, caption, [ids to highlight]]`.
4. Reuse the renderer already used by the Agentic workflow (`#agSvg`) or Executive view (`#exSvg`): zones with dashed borders, arrowheads per colour, animated dashed active edges, dim-others-while-playing, Replay/Pause/Step controls.
5. Every gate must show what happens on PASS and on FAIL; every human node must name the decision it owns.

# Definition of done (run these, fix, repeat)
1. Extract the last `<script>` to a temp file and run `node --check` on it.
2. Check there are no duplicate `id` values and every `href="#..."` resolves to an existing id.
3. Check each section id is listed in exactly one group in both `GR` arrays and has a label in both `NM` maps.
4. If Playwright/Chromium is available: open the file, click through the changed controls, confirm no page errors, and screenshot the changed section at 1440px width and again in presentation mode.
5. Report: what changed (by section id), what you verified, and anything you could not verify. Do not claim a browser test you did not run.

# Output
Apply the edits directly in the file with minimal diffs, then give a short summary and the verification results.
