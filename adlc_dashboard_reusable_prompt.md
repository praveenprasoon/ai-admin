# Reusable Prompt: Build an SDLC vs. ADLC Performance Dashboard

Copy the prompt below into ChatGPT, GitHub Copilot, or another coding assistant. Attach the existing dashboard HTML as the visual reference and attach the available CSV exports. Do not include confidential source code, prompts, secrets, or individual employee names in the data.

---

## PROMPT START

Act as a principal engineering effectiveness analyst, Jira data engineer, and front-end developer. Build a professional, self-contained, responsive HTML dashboard to measure an organization's transition from Agile SDLC (Jira, Scrum, story points, sprints) to an Agentic Development Lifecycle (ADLC), using agent workflows with human-in-the-loop approval gates.

### Organization and operating assumptions
- Organization size: 180 people across 19 feature teams.
- Current SDLC: Agile/Scrum with Jira, story-point estimation, sprint planning, development, testing, code review, and release processes.
- Target ADLC: AI agents assist with requirements refinement, design/planning, implementation, tests, review preparation, documentation, and release preparation. Humans retain defined approvals for product scope, architecture, security, code review, and production release.
- Cohort design: compare pilot teams with their own pre-ADLC baseline and, where available, contemporaneous SDLC control teams.
- Treat all attached files as the data source of truth. Do not invent measurements, silently fill blanks, or use mock values in a production-data view. If example data is necessary to demonstrate a chart, label it prominently as illustrative and keep it separate from real results.

### First, inspect and validate the input data
1. List every attached file, its grain (one row per issue, status change, sprint, human-effort record, PR, deployment, defect, or agent workflow), date coverage, row count, key fields, duplicate keys, missingness, and joins that can be made.
2. Map provided columns to the canonical schema below and explain any differences. Do not assume a Jira workflow status means the same thing in every project; use a documented status mapping.
3. Validate timestamp formats, time zones, issue keys, team IDs, sprint IDs, duplicate events, impossible date order, negative hours, and invalid story points. Report data-quality warnings in the dashboard.
4. Use a defined baseline window and post-adoption window. Prefer comparable full sprints and a clear cohort start date. Do not compare partial periods with complete periods without adjusting or flagging them.
5. If a key source is missing, still build the dashboard, but show that metric as “Insufficient data” and state exactly what source is needed. Never infer actual human effort from story points, issue counts, code volume, prompts, or agent sessions.

### Required dashboard views

**1. Executive Overview**
- Organization and cohort coverage: teams, people/FTE coverage, baseline window, post window, data freshness, and source coverage.
- Primary metrics: (a) accepted normalized work units per available engineering FTE-week; (b) median end-to-end cycle time; (c) human hours per accepted normalized unit; (d) escaped production defects per 100 accepted work items or normalized units, with denominator stated.
- Show baseline, post-period result, absolute change, relative change, and control-adjusted estimate when valid data exists.
- Show trends by sprint/week and distinguish observed changes from control-adjusted estimates.
- Make the quality/security guardrail status prominent without obscuring the underlying values.

**2. Team Scorecard**
- One row per feature team, with search and filters for cohort, work category, time window, and data completeness.
- For each team show baseline/post throughput, cycle time, human effort, defects, deployment stability where available, ADLC adoption, and sample size/coverage.
- Show team-local story-point velocity only as a within-team trend. Do not rank or aggregate raw story points across teams.
- Do not create individual-developer rankings. Use team/work-item aggregates.
- Export filtered results as CSV.

**3. Workflow/Agent Performance**
- Breakdown by requirements/refinement, design/planning, implementation, test/fix, review/approval, and release/operations.
- When telemetry exists, show run count, completion rate, retry rate, human interventions, human intervention minutes, elapsed time, model/runtime cost, and accepted outcome rate.
- Distinguish agent activity/adoption from actual productivity. Generated lines of code, prompts, sessions, and percent AI-written code are not primary productivity outcomes.
- Show human approval gates and any workflow stage where review or rework becomes a bottleneck.

**4. Metrics, Data Quality, and Jira Mapping**
- Show formulas, numerator/denominator, source fields, window, aggregation grain, missing-data caveats, and known limitations for every KPI.
- Include a checklist of missing source data and its impact on interpretation.
- Explain that cycle time is elapsed time and must not be confused with human active hours.

### Metric definitions and calculation rules

**A. Within-team story-point trend**
- Calculate accepted story points by team and sprint from issues accepted/done under the agreed Jira definition.
- Normalize by actual available engineering capacity where reliable capacity data is provided.
- Compare each team with itself over time only. Story-point scales differ between teams, so raw story points are not an enterprise-wide common unit.

**B. Cross-team throughput**
- Prefer an independently agreed, consistently applied work-size band or outcome unit captured before work starts. Example bands may map to standardized units (e.g., XS=0.5, S=1, M=2, L=4, XL=8), but only use a mapping approved by the organization and consistently applied across cohorts. Do not derive the common unit from different teams' story points after the fact.
- Throughput = accepted standardized work units / available engineering FTE-weeks.
- If a common work-size field is unavailable, show team-local throughput trends only and mark cross-team normalized throughput as unavailable.

**C. Human effort**
- Human hours per accepted unit = sum of actual human hours spent by all relevant roles and stages / accepted standardized work units. Include product/analysis refinement, engineering, writing or repairing agent-generated code, testing, code review, security review, agent supervision, debugging, rework, and release support when those hours are in scope.
- State the human-effort coverage and source (actual time entries, work logs, or time-sampling study). If only partial sampled effort is available, show the sample size and uncertainty. Do not present estimates as actuals.

**D. Cycle time and flow**
- Define the start event (for example, first transition to In Progress after Ready) and the end event (accepted/done according to the mapped workflow).
- Use median and P85 elapsed calendar or business days consistently; clearly state which. Preserve blocked/waiting time in end-to-end cycle time, and separately report stage/queue times only when status history supports it.
- If only current issue snapshots are supplied without history, do not claim exact cycle time from unverified status timestamps.

**E. Quality and operational stability**
- Escaped defects per 100 accepted items = production-discovered defects attributable to delivered work / accepted items in the same eligible cohort and observation window × 100. Show defect count, severity, denominator, and window.
- Change failure rate = production deployments causing rollback, incident, or urgent remediation / eligible production deployments. Use a consistent event definition.
- Include reopens/rework, first-pass acceptance, incident severity, security findings, and release outcomes when data exists.
- Use an appropriate defect observation window and flag cohorts with insufficient post-release follow-up.

**F. Agent effectiveness and cost**
- Workflow completion rate = workflows reaching their defined success state / eligible workflow runs.
- Retry/restart rate, human interventions per run, human intervention minutes, and model/runtime cost per accepted outcome must use explicit denominators.
- Adoption is a diagnostic measure, not proof of productivity. Cost per accepted outcome should include available model/runtime costs and, if defensibly supplied, incremental human oversight costs.

**G. Pilot vs. control**
- Report pilot pre/post and control pre/post independently.
- For a throughput metric where higher is better, a simple relative control-adjusted estimate is: ((pilot_post / pilot_pre) / (control_post / control_pre) - 1) × 100%.
- For a time/effort metric where lower is better, estimated control-adjusted reduction is: (1 - ((pilot_post / pilot_pre) / (control_post / control_pre))) × 100%.
- Only calculate these when definitions, windows, cohort assignment, and denominators are comparable and values are valid/nonzero. Label the result an estimate, not proof of causation. If the design or data does not support comparison, say “Not estimable.”

### Data files to expect
Use these canonical files when provided. One combined file is acceptable if it contains the same information, fields, and grain. Do not require all optional files to create a useful first version.

**Minimum viable data set**
1. `team_roster.csv`: `team_id, team_name, cohort` (pilot/control), `cohort_start_date`, `team_size_fte` or `headcount`, `active_from`, `active_to`.
2. `jira_issues.csv`: `issue_key, project_key, team_id, issue_type, work_category, created_at, status, resolution, story_points, sprint_id, parent_key, standard_size_band` (if available), `accepted_at` or a reliable resolved/accepted timestamp, plus an agreed work-start timestamp if available.
3. `jira_issue_history.csv`: `issue_key, changed_at, field_name, from_value, to_value`; include status, sprint, resolution, and story-point changes where available. This enables defensible cycle-time and sprint-scope reconstruction.
4. `sprint_capacity.csv`: `team_id, sprint_id, sprint_start, sprint_end, available_fte_days` or actual available FTE-weeks; optionally `planned_capacity_hours, committed_story_points, completed_story_points`. Aggregate absences/holidays; do not include personal leave details.
5. `human_effort.csv`: `team_id, issue_key` (nullable for shared work), `period_start, role_group, lifecycle_stage, human_hours, effort_source`. Include review, test/fix, rework, agent supervision, and release support. Do not include employee names.
6. `defects_incidents.csv`: `defect_id, linked_issue_key` (when known), `discovered_at, environment, severity, production_escaped, linked_release_or_deployment_id, incident_or_rollback_flag`.

**Strongly recommended for full ADLC/SDLC attribution**
7. `pull_requests.csv`: `pr_id, repository_id, issue_key, created_at, first_review_at, merged_at, review_rounds, revision_count, approval_status`; include reviewer/author hours only if captured reliably.
8. `ci_cd_events.csv`: `event_id, pr_id` and/or `issue_key`, `deployment_id, environment, event_type, started_at, completed_at, result, production_flag, rollback_flag, linked_incident_id, tests_passed, tests_failed`.
9. `agent_workflows.csv`: `workflow_run_id, issue_key, team_id, workflow_type, stage, started_at, completed_at, status, retry_count, human_intervention_count, human_intervention_minutes, model_cost_usd, runtime_cost_usd, accepted_outcome_flag`. Avoid prompt contents, secrets, and personal data.
10. `work_item_outcomes.csv` (if not represented in Jira): `issue_key, accepted_at, standard_size_band, standardized_outcome_units, first_pass_accepted, rework_count`, and an approved business-value field only if the organization already defines one.

**Optional configuration/reference files**
11. `status_mapping.csv`: `project_key, raw_status, lifecycle_stage, is_start_status, is_accepted_status, is_terminal_status`.
12. `metric_guardrails.csv`: `metric_name, threshold_type, threshold_value, direction, effective_date, owner`; use agreed thresholds, not invented ones.
13. `agent_stage_mapping.csv`: `raw_stage, canonical_stage`.

### Data and privacy constraints
- Use pseudonymous issue/team identifiers and role categories. Do not expose individual productivity scores or employee names.
- Do not include credentials, secrets, source-code contents, full prompts, customer PII, or sensitive data in telemetry exports.
- Explain retention and access assumptions if relevant, but do not claim compliance has been approved.
- Do not claim real-time integrations unless code and credentials actually establish them. A static HTML dashboard may consume local uploaded CSV/JSON files only if the implementation supports that explicitly; otherwise make it clear that data must be embedded or loaded through a configured backend.

### UI and implementation requirements
- Produce one complete, self-contained UTF-8 HTML file with embedded CSS and JavaScript. No backend or external web calls unless explicitly requested.
- Use a polished enterprise design with responsive desktop/mobile layouts, accessible labels, readable tables, clear units, tooltips or formula notes, and an obvious data freshness/source coverage indicator.
- Include filters for reporting period, team, cohort, and work category; include CSV export of the displayed data.
- Build charts only from validated input data. Use empty states rather than fabricated values. Escape imported text before inserting it into HTML to prevent script injection.
- Separate input parsing, validation, metric calculations, and rendering so the data mapping is maintainable.
- Include a visible “Illustrative data” warning only when demo data is actually present. Never mix demonstration records with real data silently.
- Return: (1) the HTML file, (2) a concise data-quality report, (3) a source-to-field mapping, and (4) the list of missing fields that block any metric.

Before finishing, verify calculations against a few raw rows, validate joins and denominators, test filters and CSV export, and state which KPIs are calculated from observed data versus unavailable. Do not claim tests were run unless they were actually run.

## PROMPT END

---

## Data collection checklist

**Required to get started:** Jira issue export + issue changelog/status history; team/cohort roster; sprint capacity/available FTE data; human-effort data or a documented sampling study; production defects/incidents.

**Required for a trustworthy full-lifecycle ADLC view:** add PR/review data, CI/CD deployment data, and agent-workflow telemetry linked back to Jira issue or PR IDs.

**Important limitations:**
- Story points are comparable as a trend within the same team, not as a universal unit across all 19 teams.
- Without actual or sampled human hours, the dashboard cannot credibly calculate human-effort savings.
- Without status history, exact stage/cycle-time calculations may not be possible.
- Without a common work-size or outcome measure, cross-team throughput should not be ranked or aggregated as if work were equivalent.
- Without a control group or other credible comparison design, observed pre/post changes should not be attributed solely to ADLC.
