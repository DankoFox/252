## Rewritten (terminology aligned to the course **Glossary**)

---

# Software Project Management — High-Yield Notes (Glossary-aligned)

## 1) Project Management Foundations

### Feasibility Study → Business Case

* A **Feasibility Study** assesses whether a project is technically feasible and worthwhile from a business perspective.
* The output typically supports a **Business Case**: the justification to start the project, demonstrating that **benefits outweigh development/implementation/operational costs** and that **business risks** are acceptable. 

**Business Case (typical structure)**

* Background / problem or opportunity
* Proposed project (timeline, budget, objectives, key constraints)
* Market context (demand, competitors)
* Organizational & operational infrastructure impacts
* Benefits (commercial + non-commercial)
* Outline implementation (rollout, operations, maintenance)
* Cost schedule
* Financial appraisal approach (e.g., ROI, NPV)

---

## 2) Investment Appraisal (Cost–Benefit)

Use consistent evaluation terms:

* **Net Profit** = total benefit − total cost
* **Payback Period** = time to recover initial investment
* **ROI** = (average annual profit / total investment) × 100
* **NPV (Net Present Value)** = discounted cash flows using a **discount rate** (time value of money + risk adjustment) 

Notes:

* Two options can share similar Net Profit/ROI but differ in **NPV** due to timing of cash flows.
* Use a **risk matrix** and consider a higher discount rate for riskier projects. 

---

## 3) Programme Management & Benefits Management

* **Programme Management**: coordinated management of a group of projects to gain benefits not achievable if managed independently. 
* **Benefits Management**: identify benefits → analyze cost/benefit trade-offs → plan realization → assign owners → monitor realization. 

---

## 4) Selecting a Project Management Approach (Methodology)

Choose the **method/methodology** based on:

* project size/complexity/risk
* budget and schedule constraints
* domain
* requirements volatility
* team capability with the method 

Rules of thumb:

* **Waterfall**: stable requirements
* **Agile (e.g., Scrum)**: evolving requirements
* **Kanban**: continuous flow, often small teams
* **Hybrid**: mix of predictive + adaptive practices 

---

## 5) Activity Planning (Scheduling Fundamentals)

Why plan:

* ensure resources are available when needed
* reduce resource contention
* create a baseline for monitoring & control
* forecast cash flow
* enable replanning throughout the lifecycle 

High-level scheduling workflow:

1. Identify activities and sequencing
2. Build an initial (“ideal”) plan
3. Allocate resources
4. Produce the final schedule 

---

## 6) Identifying Activities with WBS / PBS

* Use **WBS (Work Breakdown Structure)** to decompose work into manageable activities/work packages and avoid omissions/duplication. 
* (Glossary alignment) Pair with a **PBS (Product Breakdown Structure)** when you want deliverable-first planning (products/components first → derive activities).

Key activity assumptions:

* each activity has clear start/end and is tied to a deliverable/work product
* durations and resource usage should be estimable under normal conditions
* precedence constraints shape feasible start times 

---

## 7) Activity Network, Critical Path, and Timing Metrics

Model dependencies using an **Activity Network**:

* **AON (Activity-On-Node)** / precedence network
* **AOA (Activity-On-Arrow)** / PERT-style representation 

Core schedule calculations:

* **Forward pass** → **ES/EF** (Earliest Start / Earliest Finish)
* **Backward pass** → **LS/LF** (Latest Start / Latest Finish)
* **Float (slack)** = allowable slip without delaying project completion
* **Critical Path** = path with **zero Float**; any delay delays the project end date 

AOA rules:

* single start event + single end event
* no loops
* no dangling events 

---

## 8) Critical Chain Scheduling + Buffers

When resource constraints matter, use **Critical Chain** (like Critical Path, but **resource-constrained**).

Key terms:

* **Project Buffer**: placed at end of the Critical Chain to protect delivery date
* **Feeding Buffer**: placed where non-critical chains feed into the Critical Chain 

Execution principle (relay-race mindset):

* don’t start chains early; once started, finish ASAP
* track buffer consumption with zone signals (often green/amber/red) 

---

## 9) Resource Allocation (and schedule outputs)

**Resource Allocation** revises the plan to fit real resource constraints and produces:

* **Activity schedule** (planned start/finish per activity)
* **Resource schedule** (when/what level of resources are needed)
* **Cost schedule** (cumulative expenditure) 

Prioritization heuristic (glossary-consistent):

* prioritize by **Float** (smaller Float = higher priority)
* Burman-style ordered priority list (critical + short first, then low-float non-critical) 

Assigning individuals: account for availability, criticality, risk, training, team cohesion/motivation. 

---

## 10) Risk Management (incl. Risk Exposure)

Definitions to keep consistent:

* risk concerns future uncertainty with effects on objectives (positive or negative)
* risk includes **cause** and **impact** 

Classification:

* **Project risks** (threaten project objectives)
* **Business risks** (threaten the business case/value) 

Framework term:

* LMR buckets: **Actors, Technology, Structure** (and sometimes Tasks as an additional dimension). 

(Glossary keyword to use when translating)

* **Risk Exposure (RE)** = probability × impact (potential damage)

---

## 11) Monitoring & Control (RAG, checkpoints, EVA)

Purpose:

* monitor progress, predict schedule slippage, manage change, keep control via corrective actions 

Governance:

* oversight by **project steering committee / project management board**
* day-to-day control by **project manager** 

Progress measurement:

* use deliverable evidence where possible
* beware the “**99% complete**” reporting trap 

Status reporting:

* **RAG (Red/Amber/Green)** as a management attention signal 

(Glossary add-on you’ll want for the Vietnamese translation)

* **Earned Value Analysis (EVA)** terms: **PV / EV / AC** and derived variance/index metrics.

---

## 12) Scrum (Roles, Events, Artifacts) — Glossary-consistent

**Artifact**

* **Product Backlog (PB)**: ordered list of everything needed for the product; single source of requirement change; prioritized by **Product Owner** to maximize value. 

**Roles**

* **Scrum Master**: servant-leader; helps Scrum adoption; removes impediments; **not** a traditional project manager. 
* **Development Team**: cross-functional, self-managing; delivers potentially shippable increment each Sprint. 

**Events**

* **Sprint**: fixed timebox (typically 1–4 weeks); ends with Sprint Review/Retrospective; may be cancelled by PO if Sprint Goal becomes obsolete. 
* **Sprint Planning**: decide *what* (Sprint Goal + selected PBIs) and *how* (task breakdown). 
* **Sprint Review**: inspect increment and produce a **revised Product Backlog**. 

**Estimation**

* **Story Points** (relative estimation)
* **Velocity** = total Story Points completed in a Sprint (use average of recent Sprints)
* **Burndown Chart**: remaining work over time 

---

## 13) Sizing & Effort Estimation (FP / COSMIC / COCOMO)

* **Function Points (FP)**: EI/EO/EQ/LIF/EIF
* **COSMIC**: Entries/Exits/Reads/Writes (often for broader contexts incl. embedded)
* **COCOMO II**: modern estimation model supporting iterative/agile contexts and alternate size measures 

---

If you paste a paragraph from your Vietnamese document, I can translate it **using exactly these glossary-aligned terms** (consistent capitalization + abbreviations like *EVA, PV/EV/AC, RE, WBS/PBS, PB/PBI*, etc.).
