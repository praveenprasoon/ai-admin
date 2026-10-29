# MASTER PROMPT — Enterprise SDD / ADLC Operating Model HTML

## 1. Mission and expected deliverable

Act as a senior enterprise solution architect, staff/principal engineer, developer-experience architect, UX designer, and front-end engineer.

Create or update a **single, professional, interactive, animated, self-contained HTML file** explaining an enterprise Spec-Driven Development (SDD) / Agentic Development Lifecycle (ADLC) operating model.

The solution must explain how a large engineering organization can establish and maintain an authoritative knowledge base across many projects, repositories, teams, technologies, and delivery workflows.

This is an implementation task, not a brainstorming task.

**Required output:** `enterprise_sdd_adlc_blueprint.html`

If an existing HTML file is supplied, inspect it and extend it in place conceptually, preserving its established design and useful content. If overwriting is unavailable, produce a versioned file such as `enterprise_sdd_adlc_blueprint_v3.html`.

Do not stop at a proposed design, code snippet, wireframe, or written implementation plan. Generate the complete HTML file, validate it, and provide a working download link to the actual output.

## 2. Existing HTML design to preserve

When an existing HTML file is available, treat it as the design reference and source of existing content.

Preserve the same general visual identity:

- Enterprise architecture and financial-services aesthetic.
- Navy / deep blue primary colors, teal accents, and supporting purple, amber, green, red, and neutral colors.
- Clean typography using Inter where available, with system-font fallbacks.
- Rounded cards, restrained shadows, generous spacing, clear visual hierarchy, and readable body text.
- Sticky or clearly navigable section links.
- Responsive grids and diagrams that work on desktop, tablet, and mobile.
- Consistent icon size, alignment, stroke weight, and spacing.
- Animated workflow steps, active-state highlights, progress indicators, and replay controls.
- Interactive persona journeys, folder exploration, scenario switches, telemetry panels, and diagram navigation.

Do not redesign the entire page unnecessarily. Preserve strong existing sections, diagrams, wording, anchors, examples, and interactions unless a change is necessary to satisfy this specification.

Use an open-source icon family such as **Lucide**. Prefer embedded inline SVG symbols or equivalent local assets so icons remain available offline. Do not make the application dependent on a CDN for icons, fonts, stylesheets, JavaScript libraries, or runtime data.

Attribute the icon family and license appropriately.

The file must contain its HTML, CSS, JavaScript, diagrams, icons, sample data, and animations in one standalone document. It must not require a build step or external runtime service.

## 3. Audience and narrative

Design for an enterprise audience that includes:

- Managing directors and technology executives.
- Product owners and product managers.
- Technical program managers and delivery leads.
- Architects and security leaders.
- Engineering managers and developers.
- QA and test automation engineers.
- SRE, operations, and release management.
- Business operations and domain subject-matter experts.
- Knowledge-base curators and platform owners.

Tell one coherent story:

**Fragmented knowledge and disconnected delivery → repository discovery → knowledge engineering → project-specific context → two governed intake/update paths → SDD/ADLC engineering → cross-repository implementation → verifiable quality gates → PRs and release → production learning → reviewed knowledge updates.**

Explain the business problem, proposed system, how each person uses it, where information lives, how evidence is collected, what prevents failure, and how success will be measured.

The page must work as both a leadership walkthrough and a technical architecture reference.

## 4. Required main navigation and content

Keep or adapt the existing sections for:

1. Executive overview and problem statement.
2. Enterprise architecture.
3. Repository structure and knowledge-base design.
4. C4-style end-to-end operating model.
5. Animated personas and journeys.
6. Knowledge-base construction and project-context resolution.
7. Two knowledge update and intake flows.
8. Engineering SDD/ADLC hand-off and quality gates.
9. End-to-end telemetry and measurement.
10. Governance, parallel development, stale knowledge, and defect handling.
11. Project examples: ESPP, Oracle HCM time-card, and PeopleSoft pension/401k.
12. Challenges, controls, adoption sequence, and success measures.

Update navigation anchors so every section works correctly. Do not leave broken, duplicate, or misleading links.

## 5. C4-style enterprise architecture — essential feature

Create a large, visually prominent, animated, color-coded architecture diagram. This must be more than a collection of static cards.

Use C4-inspired system-boundary, container, component, and relationship concepts. Clearly label external systems, internal services, data stores or repositories, human decision points, and directional flows.

The complete architecture must contain the following components.

### A. Existing sources and entry points

**Code and delivery systems**
- GitHub Enterprise.
- Bitbucket Data Center or Bitbucket Cloud where appropriate.
- Existing implementation repositories.
- Branches, pull requests, commits, CI workflows, tests, deployment artifacts, and scan results.

**Business and delivery systems**
- Business-intake UI.
- Jira and Jira Align.
- Existing stories, epics, features, defects, incidents, requirements, and source links.

Show GitHub and Bitbucket as supported alternatives. Do not pretend the HTML has real authentication or live integration; describe the interactions as illustrative unless a working integration actually exists.

### B. Repository-discovery and knowledge-engineering components

Show these as separate components:

1. Repository discovery and inventory.
2. Source and configuration analysis.
3. API/schema and interface discovery.
4. Test and CI workflow discovery.
5. Dependency and relationship mapping.
6. Candidate knowledge generation.
7. Provenance, confidence, assumption, and freshness management.
8. Human validation and approval.
9. Versioned knowledge publication.
10. Search/index refresh.

The flow must animate from discovering repositories to constructing a draft knowledge base, then to owner validation and publication.

Distinguish:
- Observed implementation behavior.
- Inferred relationships.
- Candidate business rules.
- Approved business policy.
- Known defects and workarounds.
- Verified production behavior.

**Never treat reverse-engineered legacy behavior as automatically approved business policy.**

### C. Governed knowledge components

Show the layered knowledge system:

- Enterprise SDD platform.
- Reusable, owner-governed domain knowledge packs.
- Project-specific knowledge repositories.
- Feature-specific specification and dependency overlays.
- Existing implementation repositories.
- Derived search indexes and dashboards.
- Linked CI, PR, security, release, and operational evidence.

Explain which component owns the canonical record and how other components reference it.

### D. Engineering SDD/ADLC engine

Represent the engine as a separate system boundary containing:

- Project and repository context resolver.
- Requirement clarification and spec generation.
- Knowledge and dependency validation.
- Design and implementation planning.
- Task decomposition by repository.
- Human-in-the-loop approval.
- Agent/developer orchestration.
- Test planning and quality-gate evaluation.
- Evidence collection.
- Knowledge-change proposal generation.

### E. Engineering execution and feedback

Show:

- Developer and agent hand-off.
- Single-repository or multiple-repository implementation.
- Automated testing and security checks.
- Pull request creation and review.
- Protected merge.
- Release and deployment evidence.
- Production reconciliation and operational outcomes.
- Reviewed knowledge curation and versioned publication.

Connect the final feedback loop back to the governed knowledge system.

### Animation requirements

Provide:
- A **Replay full journey** button.
- Pause/resume control.
- Step-forward control.
- Progress indicator.
- Current-step explanation.
- Clearly visible animated paths or highlighted active components.
- Different colors for discovery, business intake, governance, engineering execution, and verified evidence.

The diagrams must remain understandable when animation is paused, when motion is disabled, and on small screens.

## 6. Animated knowledge-base generation

Make the knowledge base visibly appear through an animated construction sequence, instead of displaying only a pre-populated folder tree.

Provide a working demonstration for both GitHub and Bitbucket using a selectable provider toggle.

The animation must illustrate these steps.

### Step 1 — Inventory repositories

Show example repositories discovered for one project:
- React UI.
- API/service.
- AWS Glue/data pipeline.
- Liquibase/database migration.
- Terraform Enterprise/TFE infrastructure.

Display example repository URL, owner, default branch, and inspected commit SHA. Use clearly fictional placeholder domains or labels where real URLs are not supplied.

### Step 2 — Inspect engineering artifacts

Show examples such as:
- Source code and README files.
- OpenAPI or equivalent API contracts.
- JSON/YAML configuration schemas.
- Database migration scripts.
- Terraform modules and infrastructure definitions.
- Glue job definitions.
- Unit, integration, and UI tests.
- CI workflow and deployment configuration.
- Dependency manifests and security-scan results.

Do not assume every managed platform stores all of its configuration in Git.

### Step 3 — Build the relationship map

Animate relationships such as:

React UI → API → configuration/data store → Glue processing → downstream interface.

Infrastructure, databases, vendors, and other services should appear where relevant.

Identify producer/consumer relationships, schema dependencies, ownership, critical integration points, and areas where more information is needed.

### Step 4 — Generate candidate knowledge

Show folder and file nodes appearing in the tree. Differentiate newly generated candidate files from already approved content.

Candidate knowledge must include source provenance, the inspected revision, confidence or validation status, owner, and unresolved assumptions as appropriate.

### Step 5 — Human validation

Show review routing to the correct people:
- PO/business owner for business semantics.
- Domain owner for domain rules.
- Architecture for design and interface decisions.
- Security owner for security policy and exceptions.
- Operations/SRE for operational requirements.
- Knowledge curator for publication and consistency.

The curator must not automatically become the authorized decision-maker for every business or security question.

### Step 6 — Publish the knowledge baseline

Only after required approvals, show a new version or commit being published and the knowledge index being updated.

Clearly state that a knowledge base can be built from existing repositories, but undocumented behavior and unresolved business decisions still require human clarification.

## 7. Required animated project folder structure

Show an interactive, expandable, visually rich folder tree with a meaningful selection detail panel. Include animation that walks through the structure and highlights the active node.

Use this illustrative project structure:

```text
sdd-platform/
├── core/
│   ├── lifecycle-gates.yaml
│   ├── spec-templates/
│   ├── agent-skills/
│   ├── policy-checks/
│   └── telemetry-schema.json
├── domain-packs/
│   ├── compensation/
│   ├── hcm-payroll/
│   ├── peoplesoft/
│   ├── aws-data-platform/
│   └── security-resilience/
└── publishing-rules/

sdd-project-espp/
├── project.yaml
├── README.md
├── knowledge/
│   ├── business/
│   │   ├── eligibility-rules.md
│   │   ├── compensation-calculations.md
│   │   └── effective-dates.md
│   ├── architecture/
│   │   ├── system-context.md
│   │   ├── data-flow.md
│   │   └── integration-map.md
│   ├── contracts/
│   │   ├── api-contracts.md
│   │   ├── data-schemas.md
│   │   └── configuration-schema.md
│   ├── quality/
│   │   ├── invariants.md
│   │   ├── regression-strategy.md
│   │   └── nfr-profile.md
│   └── defects/
│       ├── known-defects.md
│       └── defect-watch.yaml
├── features/
│   └── COMP-1234/
│       ├── spec.md
│       ├── plan.md
│       ├── tasks.md
│       ├── dependencies.yaml
│       └── evidence-index.md
└── proposals/
    └── pending-knowledge-changes/
```

Also show the separate implementation repositories:

```text
Existing implementation repositories
├── espp-react/
├── espp-api/
├── espp-glue/
├── espp-liquibase/
└── espp-tfe/
```

These are illustrative names; actual repository URLs, ownership, branches, and identifiers should come from the project manifest.

For each selectable folder or file, explain:
- Why it exists.
- Who owns or approves its content.
- Whether it is canonical, proposed, or derived.
- Which workflows use it.
- How it relates to code and evidence.
- What should happen when it changes.

Implement real folder expansion and selection behavior. Do not animate folders in a way that makes them impossible to navigate.

## 8. Show how project-specific knowledge is assembled

Create a visual context-resolution demonstration for an ESPP compensation change.

The context resolver must assemble:

1. Enterprise SDD core and required policies.
2. The relevant pinned domain packs.
3. The project's approved business and technical knowledge.
4. The feature's requirements and acceptance criteria.
5. Relevant interface contracts, schemas, invariants, tests, and defect warnings.
6. Repository references and exact inspected commit SHAs.
7. Required gate and risk profiles.

Display the result as a context manifest and show the feature spec being generated from that specific context.

Include an illustrative manifest similar to:

```yaml
feature_id: COMP-1234
project_id: ESPP

baseline:
  enterprise_sdd_version: "3.2"
  project_knowledge_commit: "8ac91f0"
  domain_pack_commit: "5d13a72"

repositories:
  - id: espp-react
    commit_sha: "73be102"
  - id: espp-api
    commit_sha: "0b2d341"
  - id: espp-glue
    commit_sha: "a14c620"

dependencies:
  - id: COMP-RULE-014
    version: 7
  - id: API-CONTRACT-003
    version: 4

freshness_status: "revalidation_required"
```

All sample values must be clearly labeled illustrative.

Show how changes to relevant rules, contracts, or repository versions trigger targeted revalidation for affected features instead of forcing the entire organization to reload all knowledge.

## 9. Two distinct, animated update flows

Represent these as two separate lanes with individual animations. They must visibly converge on the shared, governed baseline and SDD/ADLC engine.

### Flow A — Feature/developer-driven update

1. Start from an existing Jira story, defect, change request, or engineering discovery.
2. Resolve the project and pinned knowledge baseline.
3. Retrieve the relevant rules, contracts, tests, known defects, repository commits, and dependency map.
4. Generate a spec, plan, task list, and required evidence plan.
5. Surface missing information, contradictions, assumptions, non-goals, and impacted repositories.
6. Obtain required human approvals and developer confirmation of the plan.
7. Implement changes in one or more existing repositories.
8. Run required automated tests and security checks.
9. Link PRs, CI evidence, review decisions, merge commit SHAs, and release evidence.
10. Generate a proposed knowledge change only when evidence supports an update.
11. Route it to the correct business/domain/architecture/security/operations approver.
12. Publish the approved knowledge delta and identify affected features that need revalidation.

The feature's proposed changes must not automatically become the baseline used by unrelated features.

### Flow B — Business intake/UI-driven update

1. A product owner, business stakeholder, or operations user starts guided intake.
2. Capture business outcome, scope, affected processes, constraints, exceptions, effective dates, and decision owners.
3. Retrieve existing knowledge, Jira/Jira Align items, similar features, contracts, and known defects.
4. Detect duplicate work, conflicting rules, and missing decisions.
5. Ask clarification questions and record unresolved assumptions.
6. Generate a reviewable business proposal and business-readable candidate knowledge changes.
7. Obtain the authorized business/domain owner’s approval.
8. Generate or update Jira epics, features, stories, and acceptance criteria, avoiding duplicate work.
9. Publish approved knowledge according to governance rules and record the new baseline version.
10. Hand the approved feature package to the common SDD/ADLC engine.
11. Continue through human confirmation, engineering execution, quality gates, PRs, release, and telemetry.
12. Curate additional knowledge changes arising from verified implementation and production evidence.

Do not make final business rules authoritative or create approved work from unresolved assumptions.

Both paths should share the same governance, traceability, versioning, telemetry, and approval policies. They must not evolve into separate knowledge systems.

## 10. Engineering SDD/ADLC execution flow

Create a prominent, sequential, colorful animated workflow showing the exact engineering hand-off:

**Approved intake → context resolution → spec generation → human confirmation → plan approval → repository task generation → implementation → tests and scans → linked PRs → review and merge → release evidence → knowledge curation.**

Show two distinct human decision points:
- The appropriate business/domain owner approves the intended business behavior.
- The developer/technical owner reviews and confirms the implementation plan before changes are authorized.

Architecture, security, operations, and release approvals must be invoked according to risk and policy.

The SDD artifact must include:
- Problem statement and desired outcome.
- Scope and explicit non-goals.
- Requirements and acceptance criteria.
- Existing approved rules and relevant dependencies.
- Assumptions and unresolved questions.
- Architecture/contracts affected.
- File/repository impact and task plan.
- Required tests, security checks, and quality evidence.
- Rollback/recovery considerations where applicable.
- Human approval records and baseline fingerprints.

Do not allow an AI agent to silently change business rules, ignore unrelated system invariants, or report human approval without actual approval evidence.

## 11. Multi-repository parallel implementation

Support projects with a varying set of repositories: Terraform/TFE, AWS Glue, React UI, API/service, Liquibase, data schemas, configuration code, and other technology-specific repos.

Show one feature coordinating multiple implementation lanes, such as:

```text
COMP-1234
├── React UI change → UI tests → UI PR
├── API change → unit + contract tests → API PR
├── Glue/data change → pipeline tests → Glue PR
├── Liquibase change → migration validation → database PR
└── Terraform/TFE change → IaC/security validation → infrastructure PR
```

Not every feature changes every repository. Only affected repositories and applicable tests should be selected.

Use a shared feature ID and trace/correlation ID to connect the artifacts. Show cross-repository dependencies, parallelizable tasks, blocking dependencies, linked PRs, required integration checkpoints, and the overall readiness state.

Feature-specific context must pin the exact approved knowledge versions and repository SHAs used. A later relevant baseline or contract change should cause the affected feature to be revalidated before merge or release.

Do not duplicate source code in the knowledge repository.

## 12. Explicit automated quality and security gates

Add a color-coded animated pipeline with real status concepts:

`PENDING` → `RUNNING` → `PASS`, `FAIL`, or justified `NOT APPLICABLE`.

Include:

1. Specification completeness and acceptance-criteria traceability.
2. Unit tests.
3. UI/component and browser-based UI tests where applicable.
4. API/schema/contract tests when a suitable contract exists and the change is in scope.
5. Integration and end-to-end tests where applicable.
6. Regression tests derived from business invariants, changed behavior, and historical defects.
7. Static application security testing (SAST).
8. Snyk or equivalent software-composition and vulnerability/CVE checks.
9. Secret scanning.
10. Infrastructure-as-code scanning for Terraform/TFE changes.
11. Dependency, configuration, schema, and migration validation where applicable.
12. Build, artifact, and pipeline checks.
13. Code review and protected-branch policy.
14. Release readiness and operational approval based on risk.

Distinguish:
- Failed required gate.
- Passed gate with linked evidence.
- Not applicable with an explicit reason.
- Accepted exception with authorized owner and expiry.
- Pending evidence.

If API contract tests do not exist, show that limitation and identify a compensating validation or a follow-up task when required. Do not fabricate a test result.

Required failing gates block merge/release unless policy explicitly permits an approved exception.

The browser demonstration may use simulated statuses, but it must visibly label them as illustrative. Never imply a real Snyk, GitHub, Bitbucket, Jira, or CI integration exists unless it has actually been implemented.

## 13. PR, merge, release, and knowledge-curation flow

After the gates, show:

- Linked pull request creation for each changed repo.
- Commit SHA and test/scan evidence.
- Human code review and required approvals.
- Protected merge rules.
- Release manifest with exact deployed commits.
- Deployment outcome and operational observations.
- Post-deployment reconciliation and defect/incident references.
- A proposed knowledge change tied to the relevant feature, rules, contracts, tests, and releases.
- Review and approval by the appropriate owner.
- Versioned baseline publication and dependent-feature impact analysis.

The PR itself may include or link a proposed knowledge change, but do not automatically publish unreviewed agent output as approved business knowledge.

## 14. Consistent end-to-end telemetry and dashboard

Create a prominent, professional telemetry dashboard and animate a feature trace across both intake paths, the knowledge system, all changed repositories, CI, PRs, and production.

Every event should use a consistent schema and correlate to the same feature/trace IDs.

At minimum, demonstrate fields such as:

```yaml
feature_id: COMP-1234
trace_id: trace-example-001
event_type: ci_gate_completed
timestamp: illustrative-timestamp

knowledge_version: illustrative-version
spec_hash: illustrative-hash

repo_id: espp-api
commit_sha: illustrative-sha
pull_request_id: illustrative-pr
ci_run_id: illustrative-run

model_provider: illustrative-provider
model_id: illustrative-model
input_tokens: illustrative-count
output_tokens: illustrative-count
cached_tokens: illustrative-count
tool_calls: illustrative-count
measured_cost: illustrative-cost

elapsed_time: illustrative-duration
agent_execution_time: illustrative-duration
ci_wait_time: illustrative-duration
human_review_time: illustrative-duration

gate_status: illustrative-status
security_findings: illustrative-count
defects: illustrative-count
release_id: illustrative-release
```

Use real provider/system telemetry in an actual deployment. Never invent token counts, costs, durations, test passes, or production outcomes and present them as real.

Show the following metrics and explain their definitions and denominators:

### Execution and productivity
- End-to-end feature latency.
- Agent execution time.
- Human active effort and review time.
- CI/pipeline wait time.
- Rework and review rounds.
- Throughput and goal success rate.

### AI efficiency and tool accuracy
- Input, output, and cached tokens.
- Cost by feature and lifecycle phase.
- Retry counts and model/tool usage.
- Token efficiency relative to successful outcomes.
- Tool-call accuracy and valid/failed tool calls.

### Quality and security
- Required gate completion.
- Unit/UI/API-contract/regression outcomes.
- Coverage and risk-based test traceability.
- SAST/Snyk/IaC findings, dispositions, and remediation.
- Escaped defects and change failure rate.
- Rollbacks and recovery outcomes.

### Adoption and knowledge health
- Percentage of features using governed specs.
- Human review and approval effort.
- Knowledge-change acceptance/rejection rate.
- Knowledge freshness and owner coverage.
- Stale-context detections and prevented merges.
- Production defects converted into verified regression tests.

Separate:
- Directly measured values.
- Derived calculations.
- Targets.
- Illustrative demonstration data.

Do not confuse elapsed time with active engineering effort. Do not claim improvement percentages without measured baselines and a clear measurement window.

Include a visible feature-level event timeline and a dashboard view that can filter by feature, repo, lifecycle phase, project, and time window. If interactive filtering is shown, it must work against embedded sample data.

## 15. Concurrency, stale knowledge, and defect quarantine

Explain and demonstrate these critical safeguards:

### Pinned baselines
Every feature works against a pinned knowledge baseline and repository/contract versions. The context manifest identifies exactly what informed its spec and plan.

### Impact-based revalidation
When a rule, contract, or baseline changes, identify affected features and classify them as:
- `CURRENT`
- `REVALIDATION_REQUIRED`
- `BLOCKED_BY_CONFLICT`
- `SUPERSEDED`

Do not require unrelated features to reprocess the entire knowledge base.

### Defect quarantine
A production incident or legacy implementation is not automatically the correct behavior.

Store or link:
- Expected versus observed behavior.
- Affected rule and contract IDs.
- Impacted features, versions, and releases.
- Reproduction evidence.
- A regression test.
- Remediation or accepted-risk decision.
- Verification and release evidence.

A confirmed critical defect should warn or block relevant work according to policy, and no unapproved rule should be created from the defective behavior.

## 16. Persona journeys

Preserve and expand interactive persona journeys for:

1. Product owner.
2. Engineering team/developer.
3. Architecture.
4. QA/test engineering.
5. SRE/operations.
6. Security/controls.
7. TPM/delivery lead.
8. Business operations.
9. Domain owner/knowledge curator.

Each persona must show:
- How they enter the system.
- What they supply.
- Which knowledge or context they receive.
- What decisions they are allowed to make.
- What they review or approve.
- What evidence they create.
- Which other personas receive the hand-off.

The Product Owner journey should demonstrate business intake and intent approval. The developer journey should demonstrate spec/plan confirmation, changes across one or more repos, tests, scans and PRs. Architecture and security should show appropriate design/control approvals. QA and operations should show test/release evidence and feedback. The curator should show reviewed knowledge deltas and controlled publication.

Make persona animations replayable, navigable, and connected to the broader architecture.

## 17. Detailed project examples

Retain and enhance all three examples.

### Example A — ESPP compensation hub

Show a change that can affect:
- React UI.
- API/service.
- Configuration/data store.
- Glue/data pipeline.
- Liquibase/database migration.
- Terraform/TFE infrastructure.

Knowledge must include eligibility rules, compensation calculations, effective dates, API/data contracts, configuration schemas, invariants, reconciliation expectations, NFRs, and known defects.

Animate the project context resolver and show how a feature ID connects multiple repo PRs and CI runs.

### Example B — Oracle HCM time-card configuration

Show how approved business semantics and managed configuration can be central even if some artifacts do not live in conventional Git repositories.

Knowledge should cover:
- Time rules.
- Effective dates and retroactive changes.
- Schedule exceptions.
- Payroll dependencies.
- Audit requirements.
- Relevant configuration exports/deployment artifacts where available.

Demonstrate domain-owner approval and representative time-card regression cases.

### Example C — PeopleSoft pension / 401k

Show a higher-risk legacy financial-processing scenario with:
- Business rule references.
- Interfaces and data lineage.
- Batch dependencies and cutoffs.
- Historical-result comparisons.
- Reconciliation controls.
- Security and audit checks.
- Deployment and rollback constraints.

Explain why legacy behavior does not automatically establish approved policy and why financial calculations require stronger evidence and approval.

## 18. Challenges and control mapping

Retain a visual problem-to-control section. Explicitly address:

- Scattered, duplicated, stale, and person-dependent knowledge.
- Multiple repositories and hidden dependencies.
- Parallel development conflicts.
- Knowledge changes arriving during active features.
- Production defects being learned as correct rules.
- AI agents inventing assumptions or overstating test results.
- Inconsistent telemetry and unmeasured costs.
- Token/context growth from indiscriminate retrieval.
- Noisy or suppressed security findings.
- Missing API contracts or tests.
- Unclear domain decision authority.
- A knowledge curator becoming a bottleneck.
- Managed platforms whose artifacts are not fully Git-managed.
- Lack of clear baseline measurements or proven ROI.

For every challenge, show the intended control and who owns it.

## 19. Implementation and technical requirements for the HTML

- Produce a complete HTML5 document.
- Keep CSS in `<style>` and JavaScript in `<script>`.
- Embed all diagram icons and sample datasets locally.
- Use no runtime network calls, external APIs, external stylesheets, or required CDN assets.
- Use semantic HTML, keyboard-accessible buttons, accessible labels and visible focus states.
- Respect `prefers-reduced-motion`.
- Make the layout responsive and readable on large and small screens.
- Include meaningful fallbacks if animation is unavailable.
- Do not add decorative controls that do nothing.
- Keep charts and diagrams legible, with arrows and connectors correctly aligned.
- Use consistent iconography and color semantics.
- Clearly distinguish illustrative or simulated behavior from implemented integrations.
- Avoid oversized content blocks and overcrowded mobile diagrams.
- Keep the file self-contained and reasonably small, preferably below 1 MiB.
- Include print styling suitable for saving or printing a leadership handout, if feasible.

## 20. Mandatory verification before delivery

Before declaring completion:

1. Inspect the source HTML and determine which existing sections and interactions should be preserved.
2. Implement all missing items in this prompt; do not merely append a design note.
3. Check that all internal navigation anchors resolve.
4. Check that IDs are unique and JavaScript references point to existing elements.
5. Check that all primary buttons work: full-flow replay, pause/resume, step-forward, provider toggle, folder expand/collapse, folder selection, persona journeys, scenario selection, telemetry details, and other visible controls.
6. Check JavaScript syntax and run a browser/render test if available.
7. Verify diagram connectors, active states, animation timing, mobile layout, and reduced-motion behavior as far as the environment permits.
8. Verify that the folder tree visually builds, rather than simply appearing as a static folder list.
9. Verify that the two update flows are clearly separated and converge on the common SDD/ADLC engine.
10. Verify the complete trace from GitHub/Bitbucket discovery through knowledge publication, spec, plan approval, implementation, tests/security gates, PRs, release, telemetry, and reviewed knowledge curation.
11. Ensure any demonstration metrics are labeled illustrative.
12. Save the finished file and confirm that the exact output path exists before presenting a download link.

Do not claim browser testing or integration testing occurred if it did not. If a particular verification could not be performed, disclose the limitation clearly and still provide the completed best-effort file.

## 21. Final response requirements

Deliver:
- The actual downloadable HTML file.
- A concise summary of the newly completed sections and animations.
- A short verification note identifying the checks completed and any remaining limitations.

Do not respond with only source code pasted into chat, a mockup image, a list of future changes, or a promise to complete the file later.

**Success criterion:** A stakeholder should be able to open the single HTML file and understand—both visually and technically—how the organization discovers knowledge from existing GitHub/Bitbucket repositories, builds and governs a reusable project-aware knowledge base, processes business and engineering changes through two controlled paths, generates and approves SDD artifacts, implements across one or multiple repos, proves quality and security through evidence, creates and reviews PRs, measures the full lifecycle consistently, and safely feeds verified learning back into the knowledge base.
