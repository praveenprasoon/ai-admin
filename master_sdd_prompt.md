https://github.com/accumensolutions/ai-framework
# Spec-Driven Development (SDD) Master Blueprint Prompt

This document contains a comprehensive, token-optimized **Spec-Driven Development Master Prompt** that you can copy and paste into your premium chat window (like Claude Opus 4.8 or Gemini 1.5 Pro). It instructs the AI to take any high-level user specification and immediately generate a complete, production-ready blueprint across all engineering layers—including the **React UI components**, **FastAPI endpoints**, **local SQLite database schemas**, and the **data ingestion pipeline**—without any missing code gaps.

---

## 📋 The Master SDD Prompt

```markdown
Act as a Principal Software Architect and Lead Multi-Agent Orchestrator. Review the high-level user requirements provided below. Your goal is to convert this specification into a fully engineered, production-ready software system split into decoupled, parallelizable layers. 

To prevent "vibe-coding drift" and keep token usage strictly within our limits, you must output entirely complete, end-to-end code structures. Do not use placeholders, truncated loops, or comment shortcuts like "// TODO: implement later". Every file must be fully written and ready to deploy.

---
### USER REQUIREMENTS / SYSTEM SPECIFICATION:
[INSERT YOUR DASHBOARD/APPLICATION VISION HERE]
Example: "A Portfolio Intelligence Dashboard tracking 200+ human resources across parallel programs, syncing Jira metrics, Snyk CVE data, and raw unstructured files like status emails and slide decks."
---

Generate the complete codebase mapped across these exact files:

#### 1. THE CONTRACT LAYER
- `.specify/contract.json`: A strict, valid JSON Schema (2020-12) defining the exact API data exchange payload bridging the backend data stream and the React frontend. Include fields for all required telemetry, status flags, and metadata.
- `.specify/mock_payload.json`: A production-scale JSON data asset populated with highly realistic sample data matching that exact schema (e.g., 200+ dummy resource allocations, intersecting milestones, and active vulnerability vectors) so the frontend can render immediately.

#### 2. THE LOCAL DATABASE LAYER
- `backend-pipeline/database.py`: A complete Python file utilizing SQLAlchemy to define a local SQLite relational database (`portfolio.db`). Provide clear entity models for Programs, Milestones, Resources, and Risks. Include an initialization function (`init_db()`) that safely creates the tables and sets up local session connection engines.

#### 3. THE API & DATA PIPELINE LAYER
- `backend-pipeline/app.py`: A complete Python FastAPI application file. It must implement:
  - Pydantic verification models mapped directly to the local SQLite database schemas.
  - A real data ingestion function utilizing standard Python libraries to read mock data and shape it directly into our JSON contract format.
  - A live endpoint `GET /api/v1/portfolio/stream` that pulls from the database, builds the validated payload tree, and returns it.

#### 4. THE FRONTEND VIEW LAYER
- `frontend-dashboard/src/app/page.tsx`: A complete Next.js (App Router) component page using TypeScript and Tailwind CSS. Design a clean, responsive enterprise grid layout containing:
  - A metric summary bar (Total Resources, Active Projects, High-Risk Flags).
  - A visual milestone tracking roadmap showing cross-project delays.
  - A resource utilization matrix table that automatically highlights row cells in red where `total_allocation_percentage > 100`.
  - Include local `useEffect` state hooks that fetch data from the backend API endpoint seamlessly.

#### 5. THE INFRASTRUCTURE LAYER
- `docker-compose.yml`: A clean, isolated container configuration file that orchestrates the Next.js frontend app and the FastAPI Python service, establishing local volume mapping and exposed ports so the entire application fires up with a single `docker-compose up` command.

Provide each file inside an explicit, separate markdown block labeled with its exact directory path. Ensure all types, imports, and execution handles align perfectly across every layer.
```
