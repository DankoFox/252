# Glossary (from the course slides)

## Core project-management concepts

* **Project** — A planned undertaking (typically large enough to need deliberate planning). 
* **Jobs vs. projects vs. exploration** — *Jobs* are repetitive with low uncertainty; *exploration* has highly uncertain outcomes; *projects* sit in-between. 
* **Project characteristics** — Non-routine, planned, target-driven, customer-focused, temporary team, multi-specialism, phased, time/resource constrained, large/complex. 
* **Stakeholders** — Anyone with a stake/interest in the project (users/clients, developers/implementers; inside/outside the team/organization). 
* **Feasibility study** — Checks if the project is technically feasible and worthwhile from a business point of view (done before proceeding). 
* **Business case** — Justification to start the project; should show benefits exceed development/implementation/operational costs and consider business risks. 
* **Project triangle** — Time, cost, scope (trade-offs: if one is constrained, adjust others). 
* **Management (functions)** — Planning, organizing, staffing, directing, monitoring, controlling, innovating, representing. 
* **Management control** — Turn *data* into *information* (meaningful) and use *modelling* to predict outcomes and choose actions; then *implement* remedial actions. 

---

## Lifecycle & requirements terminology

* **ISO 12207 life-cycle** — A software development life-cycle reference that includes requirements, design, code/test, installation/acceptance support (and more). 
* **Requirements elicitation** — Discover what the client needs. 
* **Requirements analysis** — Convert “customer-facing” requirements into forms developers can understand (covering functions, quality, and resource constraints/costs). 
* **Architecture design** — Based on system requirements; defines system components (hardware/software/organizational) and drives component-level requirements. 
* **Qualification testing** — Testing the whole system (not just software) and making it operational (setup, parameters, installation, training, etc.). 
* **Method / methodology** — A *methodology* is a set of methods: a way of working plus planning details (dates, staffing, tools/materials). 

---

## Project evaluation & benefits

* **Project portfolio management (PPM)** — Evaluating project proposals, assessing risk, sharing resources, handling dependencies, removing duplication, checking for gaps. 
* **Programme management** — Coordinated management of a group of projects to gain benefits not possible if managed independently. 
* **Benefits management** — Define expected benefits, analyze cost/benefit balance, plan how benefits will be achieved, assign responsibility, and monitor benefits realization (typically at programme level). 
* **Risk-adjusted evaluation (discount rate idea)** — For riskier projects you may use higher discount rates; risk can be assessed with a project risk matrix. 

---

## Planning & scheduling structures

* **Work Breakdown Structure (WBS)** — A hierarchy that breaks the project into smaller, manageable tasks/work packages (basis for planning). 
* **Product Breakdown Structure (PBS)** — A hierarchy of deliverable products/components the project must produce. 
* **Activity network** — A dependency model showing the order/precedence of activities. 
* **Earliest Start (ES) / Earliest Finish (EF)** — Earliest times an activity can start/finish given predecessor constraints. 
* **Latest Start (LS) / Latest Finish (LF)** — Latest times an activity can start/finish without delaying the project end date. 
* **Float (total float/slack)** — How long an activity can slip without affecting project completion (key for identifying critical activities). 
* **Critical chain** — A schedule focus that accounts for resource constraints (not just precedence), using buffers to protect the end date. 
* **Project buffer / feeding buffer** — Buffers placed to protect the critical chain and key integration points. 

---

## Agile / iterative method keywords

* **DSDM (Dynamic Systems Development Method)** — An agile approach emphasizing user involvement; varies scope to meet fixed time and resources. 
* **Timeboxing** — Fix time and resources, then adjust delivered functionality (scope) to fit the box. 
* **MoSCoW prioritization** — Classifies requirements into **Must**, **Should**, **Could**, and **Won’t (this time)** to manage scope. 
* **Extreme Programming (XP)** — Agile method stressing practices like small releases, testing, and close customer involvement (slides position XP as an example of “agile development”). 
* **Scrum** — Agile framework (mentioned alongside XP as an agile development approach). 

---

## Risk management

* **Risk management steps** — Risk identification → analysis/prioritization → planning → monitoring. 
* **Risk identification techniques** — Checklists, brainstorming, causal mapping. 
* **Risk exposure (RE)** — **RE = (potential damage) × (probability of occurrence)**. 

---

## Monitoring & control (status + performance)

* **RAG reporting (Red/Amber/Green)** — Status signaling: green = OK, amber = concern/needs attention, red = serious problem (used in project reporting). 
* **Checkpoints** — Progress checks that can be **time-driven** (e.g., weekly) or **event-driven** (on completion of a deliverable). 
* **Exception report / exception plan** — Formal escalation when performance goes outside tolerance; may require a revised plan and decision by governance (e.g., project board). 
* **Earned Value Analysis (EVA)** — Performance measurement integrating schedule and cost using PV/EV/AC and derived variances/indexes. 
* **PV (Planned Value) / BCWS** — Budgeted cost of work scheduled. 
* **EV (Earned Value) / BCWP** — Budgeted cost of work performed. 
* **AC (Actual Cost) / ACWP** — Actual cost of work performed. 
* **SV / SPI / CV / CPI** — Schedule & cost variance and performance indexes derived from PV/EV/AC. 

---

## Change & configuration management

* **Off-specification** — A delivered product does not meet its specification; requires formal handling (distinct from a requested change). 
* **Change request** — Request to alter an agreed specification (handled through change control). 
* **Configuration management (CM)** — Controls and tracks changes to project products and maintains integrity of product versions. 
* **Configuration item (CI)** — Any project product placed under configuration control. 
* **Configuration librarian** — Role responsible for managing the configuration repository/library. 

---

## Quality, process, and improvement

* **Entry requirements / implementation requirements / exit requirements** — Preconditions to start an activity, rules for how it’s executed, and criteria for completion. 
* **Quality Management System (QMS)** — A system of standards/processes; ISO 9001 specifies *how* standards are established and monitored (not universal product standards). 
* **ISO 9001 principles (examples)** — Customer focus, leadership, staff involvement, process focus, continuous improvement, evidence-based decisions, supplier relationships. 
* **CMM (Capability Maturity Model)** — SEI-originated model (questionnaire/interview assessment) used historically to support procurement by assessing process maturity. 
* **CMMI** — A later, more generic model intended to be adaptable across environments. 
* **KPA (Key Process Area)** — Focus areas used to improve maturity level (e.g., configuration management, QA, planning, tracking/oversight, measurement/analysis). 
* **ISO/IEC 15504 (process assessment)** — Guidance for assessing software development processes; uses a Process Reference Model (default: ISO 12207). 

---

## Testing & defect-related terms

* **Glass-box testing** — Designing tests with knowledge of the internal structure/code. 
* **Black-box testing** — Designing tests from specifications/requirements without internal knowledge. 
* **Test coverage** — A measure of how much of the code/logic is exercised by tests (e.g., statement/branch coverage). 
* **Usage profile** — Weighting/choosing tests based on how frequently features are used in practice. 
* **Bug seeding** — Introducing known defects deliberately to estimate the number of remaining undiscovered defects. 
* **Capture–recapture (defect estimation idea)** — Estimating total defects based on overlaps between independent “finders” of defects. 

