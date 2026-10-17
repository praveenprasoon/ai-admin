# GitHub Copilot Agent Prompt — Enterprise Portfolio Management Hub

## 1. Role and mission

Act as a senior full-stack architect, enterprise portfolio-management product engineer, React UI engineer, Python FastAPI engineer, SQLite data-modeling specialist, integration engineer, and QA automation lead.

You are working inside my **existing Portfolio Intelligence System**.

The current technology stack is:

- Frontend: React
- Backend: Python FastAPI
- Database: SQLite
- Existing application: Portfolio Intelligence System with an established UI theme, navigation, components, API conventions, and database.

Your task is to implement a complete, production-oriented **Enterprise Portfolio Management Hub** as an integrated feature of the existing application.

The new feature must support enterprise-wide portfolio governance, strategic objectives, programs, projects, milestones, dependencies, risks, financial and delivery metrics, artifact management, and integrations with Jira Align and Jira Software.

**Do not build a standalone application. Do not replace the existing application. Do not create a second frontend or backend. Extend the existing repository and integrate with its existing architecture.**

Work directly in the current repository. Inspect the codebase first, create an implementation plan, implement the feature, execute tests, and report what actually works.

---

# 2. Non-negotiable implementation rules

Follow these rules throughout implementation.

### Rule 1 — Inspect before modifying

Before writing code:

1. Inspect the repository structure.
2. Identify the frontend entry point, routing mechanism, left navigation, shared layouts, theme variables, component library, API client, and existing page conventions.
3. Identify FastAPI application initialization, routers, services, dependency injection, database access patterns, and error-handling conventions.
4. Inspect the SQLite schema, existing database initialization, ORM or query approach, and migration mechanism.
5. Identify authentication, authorization, logging, configuration, and test infrastructure.
6. Read the existing project instructions, including applicable `AGENTS.md`, `README.md`, and repository-specific Copilot instructions.
7. Run the existing tests and record the baseline failures before making changes.

Do not assume a particular directory structure, router library, ORM, authentication framework, or UI component library. Discover the actual implementations.

### Rule 2 — Preserve the existing application

- Preserve the current visual theme, colors, typography, spacing, design tokens, dark/light mode behavior, reusable components, and responsive layout.
- Reuse the existing left navigation, header, breadcrumbs, buttons, dialogs, tables, cards, notifications, forms, and API utilities.
- Add a new left-navigation entry named **Portfolio Management**.
- Add child navigation entries for the modules specified below.
- Follow existing route naming and authorization conventions.
- Do not redesign unrelated pages.
- Do not replace the application's current branding or global CSS.
- Do not add a competing design system or unnecessary UI dependency.
- Do not remove or rename existing features.

If a required component does not exist, create a reusable component that follows the current application theme.

### Rule 3 — No hallucinated codebase assumptions

- Inspect actual files before referencing or modifying them.
- Use existing packages and established conventions wherever practical.
- Do not invent existing API endpoints, database tables, environment variables, or integrations.
- Do not create duplicate models or services when equivalent implementations already exist.
- If a required decision depends on missing repository information, investigate the codebase first.
- If the information remains unavailable, choose the smallest compatible implementation and document the assumption.
- Never claim that a test passed, endpoint works, record persisted, or external integration succeeded unless it was verified.

### Rule 4 — Real functionality, not a mockup

All primary UI actions must connect to actual backend endpoints and database persistence.

Do not leave static dashboards, fake success messages, hardcoded counts, placeholder buttons, or demo-only CRUD operations as the implementation.

Seed data may be used for development or testing, but it must be clearly identified and must not be confused with live enterprise data.

Jira and Jira Align integrations must use real API adapters when configured. Without credentials, display an honest, explicit configuration or disconnected state.

### Rule 5 — Small, verifiable implementation steps

Implement the feature in phases. After each phase:

- Run relevant tests.
- Check frontend compilation and linting when configured.
- Check backend startup and API behavior.
- Fix regressions before proceeding.
- Keep the existing application usable.

Do not stop after generating an architecture document or UI skeleton. Continue through implementation and verification.

---

# 3. Product objectives

The Portfolio Management Hub must provide a single enterprise workspace for:

1. Viewing the entire portfolio landscape.
2. Navigating the hierarchy from enterprise strategy to delivery execution.
3. Connecting strategic objectives to measurable business outcomes.
4. Managing programs, projects, initiatives, and milestones.
5. Visualizing dependencies and critical delivery commitments.
6. Managing risks, assumptions, issues, decisions, and actions.
7. Managing artifacts and supporting evidence.
8. Monitoring investment, budget, delivery health, and benefits realization.
9. Integrating with Jira Align and Jira Software.
10. Providing traceability, audit history, and enterprise governance.

Support executive users who need a concise portfolio view and delivery managers who need detailed records, filters, actions, and drill-down navigation.

---

# 4. Left navigation and application integration

Add the following navigation structure under the existing application's left navigation.

**Portfolio Management**

- Executive Overview
- Portfolio Explorer
- Programs
- Projects & Initiatives
- Strategic Goals
- Roadmaps & Milestones
- Dependencies
- Risks, Assumptions & Decisions
- Artifact Library
- Financials & Benefits
- Metrics & Governance
- Integrations
- Administration

Requirements:

- Use the existing navigation component and route mechanism.
- Support active-navigation highlighting.
- Use the existing icon library if available.
- Support nested navigation if the existing application supports it.
- Ensure all routes work with direct URL navigation and page refresh.
- Respect existing authentication and authorization.
- Use existing breadcrumbs and page layout patterns.
- Ensure responsive behavior works on desktop, tablet, and mobile.
- Do not create a separate root application or duplicate header/sidebar.

Each navigation item must lead to a functional page, not an empty placeholder.

If an optional capability cannot be completed because of a genuine dependency, expose a clearly labeled configuration or unavailable state and document the reason.

---

# 5. Enterprise hierarchy and data relationships

Implement a consistent, relational data model that supports the following conceptual hierarchy:

Enterprise
→ Strategic Goals
→ Portfolios
→ Programs
→ Projects / Initiatives
→ Workstreams / Deliverables
→ Milestones

The hierarchy is conceptual, not a requirement that every entity have exactly one parent. Support the many-to-many relationships needed for real enterprise governance.

For example:

- A portfolio can support multiple strategic goals.
- A program belongs to an appropriate portfolio or organizational scope.
- A project belongs to an appropriate program and may be associated with multiple strategic goals.
- A milestone may depend on milestones in other projects or programs.
- A risk can affect multiple projects or milestones.
- An artifact can be linked to multiple relevant records.
- A goal can have multiple KPIs and outcome measurements.

Implement explicit foreign keys and relationship tables where needed. Do not store relationships only as comma-separated text or unvalidated JSON.

Every core record should support, where applicable:

- Internal stable identifier.
- Human-readable name.
- Unique enterprise key or number where required.
- Description.
- Lifecycle status.
- Health status.
- Priority.
- Owner.
- Accountable executive or sponsor.
- Business unit.
- Start date and target completion date.
- Created and updated timestamps.
- Created-by and updated-by attribution when supported by authentication.
- Optional source-system identifier.
- Optional source-system URL.
- Optional external synchronization metadata.
- Audit history.

Use the repository's existing identifier and timestamp conventions. Use UTC consistently for stored timestamps and handle date-only values correctly.

Do not introduce duplicate records when importing the same external entity more than once.

---

# 6. Feature specifications

## 6.1 Executive Overview

Build an executive dashboard using actual database-backed data.

Include:

- Total portfolios, programs, projects, and initiatives.
- Count of records by health status.
- Strategic-goal alignment and progress.
- Milestones due soon, overdue, completed, and at risk.
- Critical risks and unresolved decisions.
- Budget baseline, actual spend, forecast, and variance when financial data exists.
- Planned versus realized benefits.
- Delivery confidence and milestone predictability.
- Recently updated portfolios and programs.
- Items requiring executive decisions or escalation.
- Integration health and last successful synchronization.

Provide date-range and organizational filters where appropriate.

Every KPI must have a documented calculation and data source.

Counts and percentages must be derived from backend data. Never hardcode dashboard values as if they were live enterprise metrics.

Allow users to select a KPI or chart element to navigate to the underlying filtered records.

Clearly distinguish unavailable data from zero values.

## 6.2 Portfolio Explorer

Implement:

- Portfolio list and card views.
- Hierarchical portfolio/program/project tree.
- Search by name, description, owner, or enterprise key.
- Filters for health, status, owner, business unit, and date.
- Sorting and pagination.
- Create, view, edit, archive, and authorized delete operations.
- Portfolio detail pages or panels.
- Linked strategic goals.
- Linked programs and projects.
- Financial summaries.
- Milestones and dependencies.
- Risks and decisions.
- Linked artifacts.
- Portfolio-level KPIs and governance completeness.

Each portfolio detail page must provide navigation into its associated programs, projects, goals, milestones, risks, and artifacts.

Use a confirmation flow for destructive actions. Prefer archival or soft deletion where existing application conventions permit.

## 6.3 Programs

Implement a dedicated program management workspace with:

- Program identity, purpose, sponsor, owner, and lifecycle.
- Parent portfolio.
- Associated strategic goals.
- Associated projects and initiatives.
- Start date, target date, and current forecast.
- Health and progress.
- Milestones and dependencies.
- Risks, assumptions, issues, decisions, and actions.
- Linked artifacts.
- Program status reporting.
- External Jira Align identifiers and links when applicable.

Provide a program detail view with tabs or sections consistent with the existing UI.

Allow users to drill down from program to project and from project to its delivery records.

## 6.4 Projects and Initiatives

Implement project CRUD and lifecycle management.

Fields should include:

- Project name and key.
- Parent program.
- Related portfolio and strategic goals.
- Description and business outcome.
- Owner and sponsor.
- Status, priority, and health.
- Start date, baseline completion date, and forecast completion date.
- Progress percentage or a documented progress calculation.
- Budget baseline and forecast when available.
- External Jira project and Jira Align identifiers.
- Linked milestones, dependencies, risks, and artifacts.

Provide list, card, and detail views.

Allow users to filter and sort by program, owner, health, lifecycle status, and target date.

Do not silently overwrite baseline dates or financial values when forecasts change. Preserve baseline versus current forecast where appropriate.

## 6.5 Strategic Goals and KPIs

Implement a strategic-goal management module.

Each goal should support:

- Goal name and description.
- Strategic theme or enterprise objective.
- Business owner and executive sponsor.
- Time horizon.
- Status and progress.
- Measurable target.
- Associated portfolios, programs, and projects.
- KPI definitions and measurements.
- Planned versus actual outcome.
- Supporting artifacts.
- External Jira Align objective or strategic-theme mapping.

KPI fields should support:

- KPI name.
- Description and business definition.
- Unit of measure.
- Baseline.
- Target.
- Current value.
- Measurement date.
- Direction of improvement.
- Data source.
- Responsible owner.

Do not calculate goal progress as a simple average of unrelated KPI percentages unless an explicit weighting rule exists.

Make goal-to-investment and goal-to-delivery traceability visible.

## 6.6 Roadmaps and Milestones

Implement a milestone register with:

- Milestone name and key.
- Parent project or program.
- Owner.
- Baseline date.
- Current forecast date.
- Actual completion date.
- Status.
- Health.
- Priority.
- Criticality.
- Dependency relationships.
- Associated risks and artifacts.
- Jira Align or Jira links when applicable.

Provide:

- Table view with search, filtering, and sorting.
- Timeline or roadmap view.
- Overdue and upcoming milestone views.
- Baseline-versus-forecast comparison.
- Dependency indicators.
- Drill-down into milestone details.

Use a compatible existing charting or timeline library if one is already present. If a new dependency is necessary, justify it before adding it.

Do not invent a critical-path calculation. Implement a real dependency graph and clearly document whether full critical-path scheduling is supported.

## 6.7 Dependencies

Implement first-class dependency records.

Each dependency should include:

- Source record.
- Target record.
- Relationship type.
- Description.
- Owner.
- Status.
- Required-by date.
- Impact and severity.
- Mitigation or resolution plan.
- External source reference when applicable.

Support dependencies across projects and programs.

Prevent invalid self-references and handle circular dependencies. If cycle detection is implemented, validate the dependency graph before saving a relationship.

Provide:

- Dependency register.
- Upstream and downstream views.
- Blocked and blocking indicators.
- Dependency detail view.
- Filtering by owner, status, severity, and due date.

If a graphical dependency map is implemented, its nodes and edges must come from real backend relationships.

## 6.8 Risks, Assumptions, Issues, Decisions and Actions

Implement an enterprise RAID workspace.

Support the record types:

- Risk
- Assumption
- Issue
- Decision
- Action

Common fields:

- Title and description.
- Record type.
- Parent portfolio, program, project, or milestone.
- Owner.
- Priority or severity.
- Status.
- Created date.
- Due date.
- Impact.
- Probability for risks where applicable.
- Mitigation or resolution plan.
- Decision outcome where applicable.
- Related dependencies.
- Linked artifacts.
- Escalation state.
- Resolution date.

Provide:

- RAID register.
- Search and filtering.
- Overdue action indicators.
- Critical risk summary.
- Decision log.
- Owner accountability.
- Record detail view.
- Audit history.

Use consistent status and severity enumerations. Validate transitions where required.

## 6.9 Central Artifact Library

Implement a centralized artifact catalog for enterprise governance documents.

Artifact metadata should include:

- Artifact title.
- Type.
- Description.
- Owner.
- Parent portfolio, program, project, goal, milestone, or risk.
- Tags.
- Version.
- Lifecycle status.
- Confidentiality classification if supported.
- Created and updated timestamps.
- Source repository.
- External URL or document identifier.
- Optional uploaded file reference.
- Related records.

Support artifact categories such as:

- Business case.
- Portfolio charter.
- Program charter.
- Project charter.
- Strategic roadmap.
- Integrated delivery plan.
- Status report.
- RAID register.
- Decision record.
- Architecture document.
- Financial plan.
- Benefits realization plan.
- Governance evidence.
- Meeting minutes.
- Release plan.
- Test and acceptance evidence.

Required behavior:

1. Search and filter by name, type, owner, tags, program, portfolio, and project.
2. Open artifact details.
3. Link and unlink artifacts to authorized records.
4. Edit metadata.
5. Track versions or revisions.
6. Open external documents through validated URLs.
7. Upload and download files if the repository supports safe file storage.
8. Validate file types and enforce size limits.
9. Prevent unsafe file paths and unauthorized access.
10. Track relevant changes in audit history.

Do not store arbitrary file contents as base64 in SQLite. Use an appropriate file-storage approach already available in the application or a controlled local storage directory with database metadata.

If an external repository such as SharePoint is not currently integrated, support external links and a clearly labeled future connector rather than pretending files are synchronized.

## 6.10 Financials and Benefits

Implement financial tracking that is sufficient for enterprise portfolio governance.

Support, where data is available:

- Approved budget baseline.
- Actual spend.
- Forecast cost.
- Budget variance.
- Planned benefits.
- Realized benefits.
- Benefits target.
- Benefits measurement date.
- Currency.
- Financial period.
- Source and approval status.

Support roll-up from project to program and portfolio, without double-counting financial records.

Define the aggregation rules and currency assumptions. Do not add amounts in different currencies without a documented conversion policy.

If existing financial data is unavailable, allow authorized users to enter or import values and label the source and last update.

## 6.11 Metrics and Governance

Implement a configurable governance dashboard.

Include metrics such as:

- Delivery health distribution.
- Milestone predictability.
- Overdue milestone rate.
- Risk exposure.
- Open decision aging.
- Budget utilization.
- Forecast variance.
- Benefits realization.
- Strategic-goal alignment.
- Artifact completeness.
- Integration freshness.
- Data quality and synchronization failures.

Define each metric explicitly, including numerator, denominator, time window, and source data.

Allow filtering by portfolio, program, business unit, owner, and reporting period where relevant.

Do not present sample values as real metrics. If a metric cannot be computed reliably, display a clear unavailable state and identify the missing data.

## 6.12 Administration

Provide administrative capabilities using the existing application authorization model:

- Manage permitted lifecycle statuses and priorities if configuration is supported.
- Manage organizational metadata.
- Configure integration connections.
- Configure synchronization mappings.
- View synchronization history.
- View failed records and validation errors.
- Retry failed synchronization jobs safely.
- Review audit history.
- Configure artifact categories and metadata where appropriate.

Protect administrative endpoints using the existing authentication and authorization mechanism.

---

# 7. Jira Align and Jira Software integration

Implement a real integration architecture, not a UI-only integration screen.

## 7.1 Integration discovery

Before coding:

1. Inspect the repository for existing Jira clients, authentication configuration, API wrappers, integration models, and background jobs.
2. Reuse existing integration infrastructure when it is suitable.
3. Identify the Jira and Jira Align deployment type from existing configuration or ask for the missing information only when necessary.
4. Confirm supported API versions and available endpoints using official documentation or existing project references.
5. Do not assume that every Jira Align entity or endpoint is accessible through every deployment.

If credentials or deployment information are unavailable, implement the adapter interfaces, configuration validation, tests with mocked HTTP responses, and a disconnected state. Do not fabricate successful live synchronization.

## 7.2 Integration configuration

Support configuration of:

- System type.
- Base URL.
- Authentication method.
- Secure credential reference.
- Enabled/disabled state.
- Sync direction.
- Selected entity types.
- Field mappings.
- Synchronization schedule or manual trigger.
- Last successful sync.
- Last attempted sync.
- Connection and synchronization status.

Use environment variables or an existing secure secret-management facility for sensitive configuration.

Never hardcode API tokens, passwords, client secrets, or authorization headers in source code, frontend bundles, logs, or SQLite records as plaintext.

Do not expose secrets through API responses.

Use HTTPS for remote connections and validate configured base URLs.

## 7.3 Jira Software entities

Where supported by the configured Jira API, integrate:

- Jira projects.
- Issues and epics.
- Issue keys and summaries.
- Issue types and statuses.
- Assignees.
- Priorities.
- Sprint and release metadata where available.
- Parent and issue relationships.
- Links to source records.
- Progress indicators derived from explicitly defined rules.

Map Jira issues and epics to the correct internal delivery entities.

Do not assume that every Jira issue is a project or that every Jira project maps one-to-one to an enterprise portfolio.

## 7.4 Jira Align entities

Where supported by the configured Jira Align API and permissions, integrate relevant entities such as:

- Strategic themes and objectives.
- Portfolios.
- Programs or program increments.
- Capabilities, features, and related delivery records.
- Objectives and key results where supported.
- Milestones and dependencies where available.
- External identifiers and source URLs.

Document the mapping for the actual API version and deployment.

Do not assume Jira Align uses the same hierarchy, field names, or permissions as Jira Software.

## 7.5 Source-of-truth policy

Define ownership at the field or entity level.

Initial recommended policy:

- Jira Align: strategic objectives and enterprise agile-planning records when those entities are managed there.
- Jira Software: delivery issues, epics, sprint-level progress, and related execution records.
- Portfolio Intelligence System: enterprise-specific governance metadata, artifact catalog, audit history, and locally managed information unless an authoritative external source is explicitly configured.

Make this policy configurable where appropriate.

Avoid bidirectional overwrites without an explicit field-ownership rule.

## 7.6 Synchronization requirements

Implement:

- Manual synchronization.
- Incremental synchronization when supported by the source API.
- Pagination.
- Request timeouts.
- Bounded retries and backoff for transient failures.
- Rate-limit handling.
- Authentication error handling.
- Field validation.
- Duplicate detection.
- Idempotent upserts.
- Source-to-local ID mappings.
- Synchronization logs.
- Per-record error details.
- Retry of failed records.
- Last successful synchronization timestamps.
- Conflict detection.
- Read-only mode when write permissions are unavailable.

Never delete local records just because a record is absent from one paginated or failed API response.

Do not silently overwrite locally managed fields with external data.

Do not perform blocking network synchronization inside ordinary FastAPI request handlers when it could take a significant amount of time. Use existing background-job infrastructure if present; otherwise implement a safe, bounded approach compatible with the existing deployment and document the operational limitations.

Use mocked API tests for pagination, retries, duplicate records, mapping errors, authentication failures, rate limiting, and partial synchronization failures.

---

# 8. Backend architecture and API requirements

Use the existing FastAPI architecture.

Organize new code according to the repository's conventions, separating responsibilities where appropriate:

- API routers.
- Request and response schemas.
- Business services.
- Persistence or repository layer.
- Database models.
- Integration adapters.
- Configuration.
- Validation and error handling.
- Tests.

Do not create a second FastAPI application.

Do not place the entire feature in a single oversized router or service file.

Implement REST endpoints following the existing API naming conventions.

The following is a conceptual API contract. Inspect the existing application before choosing exact route prefixes or names.

| Resource | Required operations |
|---|---|
| Portfolios | List, detail, create, update, archive |
| Programs | List, detail, create, update, archive |
| Projects | List, detail, create, update, archive |
| Strategic goals | List, detail, create, update, archive |
| KPIs | List, create, update, record measurements |
| Milestones | List, detail, create, update, complete |
| Dependencies | List, create, update, remove where authorized |
| RAID | List, detail, create, update, resolve |
| Artifacts | List, detail, create, update, link, unlink |
| Financials | Record, update, list, summarize |
| Metrics | Dashboard summary, filtered metrics, drill-down |
| Integrations | Configure, validate, test connection |
| Synchronization | Trigger, status, history, failed records, retry |
| Audit | List authorized history and record changes |

API requirements:

1. Validate request payloads with the project's existing schema conventions.
2. Use correct HTTP status codes.
3. Return consistent error responses.
4. Add pagination, sorting, and filtering for collection endpoints.
5. Validate foreign keys and referenced records.
6. Avoid N+1 query patterns in hierarchy and dashboard endpoints.
7. Use database transactions for multi-record operations.
8. Add appropriate indexes for common filters and foreign keys.
9. Keep internal exceptions and credentials out of public error messages.
10. Generate or update the OpenAPI schema through the existing FastAPI mechanism.
11. Preserve existing endpoints and behavior.
12. Add integration tests for the actual API contract.

Use appropriate request and response models. Do not expose internal ORM objects or secret configuration directly.

---

# 9. SQLite data integrity and schema evolution

SQLite is the current database and must remain the database for this implementation.

Do not migrate to PostgreSQL, MySQL, or another database unless I explicitly authorize that change.

Before schema changes:

1. Inspect the current database schema and initialization mechanism.
2. Determine whether a migration framework already exists.
3. Reuse the existing migration mechanism.
4. If none exists, implement a safe, versioned schema migration approach compatible with the current application.
5. Preserve existing data and unrelated tables.
6. Avoid destructive schema resets.

Required safeguards:

- Enable foreign-key enforcement using the existing connection configuration.
- Add indexes for foreign keys and common lookup fields.
- Use transactions for schema migrations and multi-record updates.
- Handle concurrent writes appropriately for SQLite.
- Configure a sensible busy timeout and connection lifecycle.
- Avoid long-running transactions.
- Test migration against a copy of an existing database containing representative records.
- Ensure fresh database initialization works.
- Ensure application startup does not erase existing user data.

If the application uses SQLAlchemy, SQLModel, or direct SQLite access, follow its existing pattern. Do not introduce a second ORM.

Do not add a database migration dependency unless necessary and justified.

---

# 10. Frontend implementation requirements

Use the existing React application, routing system, UI library, and API client.

Implement reusable components where useful, such as:

- Portfolio summary cards.
- Hierarchy tree.
- Searchable data table.
- Status and health indicators.
- Filter toolbar.
- Detail panel.
- Create/edit dialog.
- Confirmation dialog.
- Milestone timeline.
- Dependency list or graph.
- RAID register.
- Artifact metadata panel.
- KPI card.
- Integration status panel.
- Loading, empty, and error states.

Follow the existing conventions for:

- State management.
- API calls.
- Form validation.
- Notifications.
- Route guards.
- Error handling.
- Accessibility.
- Responsive behavior.

All primary user actions must work.

### UI acceptance criteria

- The Portfolio Management entry appears in the existing left navigation.
- All specified modules can be opened.
- Lists load from FastAPI endpoints.
- Create, edit, and archive actions persist correctly.
- Record detail pages show linked records.
- Search, sorting, filters, and pagination work.
- Forms display validation errors.
- API errors are shown in a user-friendly manner.
- Loading and empty states are present.
- Refreshing the browser does not lose saved records.
- Unauthorized actions are prevented.
- Existing theme and navigation remain intact.
- No dead-end buttons or fake integration success indicators remain.
- No unrelated existing application pages regress.

Avoid duplicating API requests, losing updates during navigation, or treating an optimistic frontend update as a confirmed database save.

---

# 11. Security, authorization, and auditability

Use the application's existing authentication and authorization system.

Do not invent a replacement login system.

If the application has no authentication, identify that as an important security limitation and implement the feature in a manner consistent with the existing deployment rather than inventing enterprise identities.

Apply authorization to both UI actions and backend endpoints.

Implement or extend audit history for important operations:

- Create.
- Update.
- Archive or delete.
- Relationship changes.
- Financial baseline changes.
- Status and health changes.
- Artifact metadata and version changes.
- Integration configuration changes.
- Synchronization results.
- Administrative actions.

Record actor, action, entity type, entity identifier, timestamp, and appropriate change metadata.

Avoid recording passwords, access tokens, or unnecessary sensitive data.

Validate input, protect against SQL injection and cross-site scripting, and avoid unsafe file uploads and path traversal.

Use the existing CORS, session, CSRF, and authentication patterns as applicable.

Do not log secret headers, tokens, or full sensitive payloads.

---

# 12. Performance and reliability

Design for a large organizational data set, even though the initial database is SQLite.

Requirements:

- Server-side pagination and filtering for potentially large lists.
- Database indexes for frequently queried columns.
- Efficient dashboard aggregation.
- Bounded API request timeouts.
- Consistent transaction handling.
- Safe handling of repeated submissions.
- Appropriate error logging.
- No unbounded loops over remote APIs.
- No unbounded loading of all records into the frontend.
- Efficient retrieval of hierarchy and linked records.
- Explicit limits for uploads and bulk operations.

Do not claim high concurrency or enterprise-scale write throughput solely because the implementation works with SQLite.

Document relevant SQLite limits, deployment assumptions, and future scaling considerations without changing the required database.

---

# 13. Testing strategy

Inspect the existing test framework and add tests consistent with it.

## Backend tests

Test:

- Schema initialization and migration.
- Foreign-key enforcement.
- Portfolio CRUD.
- Program and project relationships.
- Goal and KPI management.
- Milestone lifecycle.
- Dependency creation and validation.
- RAID creation and resolution.
- Artifact creation and linking.
- Financial aggregation.
- Dashboard metrics.
- Filtering and pagination.
- Invalid references and malformed input.
- Authorization.
- Audit records.
- Integration mapping.
- Duplicate synchronization.
- Partial failures and retry behavior.
- Preservation of pre-existing database records.

Use isolated test databases and mocked external API clients.

## Frontend tests

Use the existing frontend test framework to verify:

- Navigation and route behavior.
- Rendering of API-backed lists.
- Create/edit forms.
- Validation and error states.
- Search and filtering.
- Detail panels.
- Relationship navigation.
- Loading and empty states.
- Integration configuration behavior.

## End-to-end tests

If browser-based end-to-end testing already exists, extend it to cover a representative workflow:

1. Open Portfolio Management.
2. Create a portfolio.
3. Create a program associated with that portfolio.
4. Create a project associated with that program.
5. Associate a strategic goal.
6. Add a milestone and dependency.
7. Record a risk.
8. Add and link an artifact.
9. Verify the executive dashboard reflects the saved data.
10. Refresh the application and verify persistence.
11. Verify that the corresponding audit history exists.
12. Verify integration status accurately reflects whether a real connection is configured.

Do not report tests as passed if they were not executed.

---

# 14. Implementation phases

Execute the work in this order.

## Phase 0 — Repository discovery and baseline

- Inspect the complete relevant repository.
- Identify the existing architecture, theme, navigation, schema, migrations, integrations, and tests.
- Run baseline tests.
- Produce a concise implementation plan referencing actual repository paths.
- Identify compatibility risks and assumptions.

Do not start with a new scaffold.

## Phase 1 — Domain model and database

- Design and document the entity relationships.
- Implement models and schemas.
- Add safe database migrations.
- Add foreign keys, constraints, and indexes.
- Test migration against existing data.
- Verify fresh database initialization.

## Phase 2 — Backend APIs

- Implement the resource endpoints and business services.
- Add validation, filtering, pagination, authorization, and audit history.
- Implement dashboard aggregations.
- Add backend tests.
- Verify API contracts.

## Phase 3 — React navigation and core screens

- Add Portfolio Management to the existing sidebar.
- Implement portfolio explorer, programs, projects, and details.
- Preserve the existing theme and shared components.
- Connect all screens to the backend.
- Verify CRUD and browser-refresh persistence.

## Phase 4 — Governance and artifacts

- Implement strategic goals and KPIs.
- Implement milestones and dependencies.
- Implement RAID management.
- Implement artifact management.
- Implement financials and benefits.
- Implement governance metrics.
- Add cross-links and traceability between entities.

## Phase 5 — Jira Align and Jira

- Implement connection configuration.
- Implement source-of-truth mappings.
- Implement API adapters.
- Implement synchronization, ID mappings, and error handling.
- Add mocked integration tests.
- Test real connections only if valid credentials and access are available.
- Report actual integration limitations.

## Phase 6 — End-to-end verification

- Run backend tests.
- Run frontend tests.
- Run migrations against a representative existing database.
- Verify the frontend and backend start using the repository's existing commands.
- Exercise the principal end-to-end workflow.
- Fix regressions.
- Inspect browser console and server logs where tooling permits.
- Update documentation.

Do not stop at the end of a phase merely to provide a progress summary. Continue to the next phase unless blocked by a concrete issue or a required decision.

---

# 15. Required repository deliverables

Implement the actual feature, including the appropriate source files in the existing repository.

Deliver:

1. Updated React navigation and routes.
2. Functional portfolio management screens.
3. Backend routers and business services.
4. Database models and safe migrations.
5. API schemas and validation.
6. Audit history.
7. Integration adapters and configuration.
8. Automated tests.
9. Updated API and setup documentation.
10. A final implementation report.

Documentation should explain:

- New routes and endpoints.
- Database entities and relationships.
- Migration and initialization steps.
- Configuration variables.
- Jira and Jira Align authentication requirements.
- Field mappings and synchronization behavior.
- How to run tests.
- Known limitations.
- Any features not implemented.

Do not generate a second repository, standalone mockup, replacement application, or unrelated infrastructure stack.

Do not introduce a new job queue, cache, container orchestration platform, or additional database unless the existing architecture and actual requirements justify it. Prefer existing infrastructure.

---

# 16. Definition of done

The feature is complete only when all applicable conditions below have been verified.

### Application integration

- [ ] Existing application still starts.
- [ ] Existing routes and functionality are preserved.
- [ ] Portfolio Management appears in the existing left navigation.
- [ ] The feature follows the existing UI theme.
- [ ] All required modules are accessible.

### Data and APIs

- [ ] Schema migrations preserve existing data.
- [ ] Core records are persisted in SQLite.
- [ ] Relationships are enforced and queryable.
- [ ] CRUD and archive operations work.
- [ ] Search, filtering, and pagination work.
- [ ] Dashboard metrics are calculated from persisted data.
- [ ] Errors and invalid references are handled correctly.

### Governance

- [ ] Goals link to portfolios and delivery work.
- [ ] Programs and projects have appropriate parent relationships.
- [ ] Milestones and dependencies can be managed.
- [ ] Risks, decisions, and actions are traceable.
- [ ] Artifacts can be linked to relevant records.
- [ ] Financial and benefits calculations have explicit rules.
- [ ] Relevant changes are auditable.

### Integrations

- [ ] Jira and Jira Align adapters use verified API contracts.
- [ ] Configuration and credentials are handled securely.
- [ ] Synchronization is idempotent and handles failures.
- [ ] External identifiers and source links are retained.
- [ ] Disconnected integrations are represented honestly.
- [ ] No fake successful live synchronization is displayed.

### Quality

- [ ] Backend tests run.
- [ ] Frontend checks run.
- [ ] Relevant end-to-end tests run where supported.
- [ ] Existing regressions are fixed or explicitly documented.
- [ ] Setup and integration documentation is updated.
- [ ] Actual limitations are reported.

---

# 17. Final instructions to Copilot

Start by inspecting the repository and reporting:

1. The actual frontend and backend architecture.
2. The existing theme and navigation implementation.
3. The current database and migration approach.
4. Existing authentication and authorization.
5. Existing testing and integration infrastructure.
6. The files that will need modification or creation.
7. Any blockers that genuinely require a decision.

Then begin implementation.

**Do not ask me to manually design every class, endpoint, page, or database table.** Use the repository and this specification to make sensible, compatible engineering decisions.

Ask a question only when an unresolved decision materially affects correctness, security, destructive data changes, or compatibility with an existing integration.

Implement the feature incrementally, verify actual behavior, and continue until the definition of done is met or a concrete blocker prevents further progress.

At completion, provide a concise report containing:

- Features implemented.
- Actual files changed.
- Database migrations performed or required.
- Endpoints added.
- Tests executed and their real results.
- Jira/Jira Align integration status.
- Exact commands to start the application and run tests.
- Remaining limitations and any work that could not be completed.

**The priority is a fully integrated, maintainable, database-backed enterprise portfolio-management feature that works within my existing Portfolio Intelligence System—not a visually convincing but nonfunctional prototype.**
