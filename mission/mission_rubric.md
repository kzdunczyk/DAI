# DAI Mission — Grading Rubric
**Data & AI in Economics | TU Dortmund**

Missions are assessed on the five dimensions below. Each dimension is scored 0–4.  
**Total: 20 points.**

---

## Scoring Key

| Score | Meaning |
|-------|---------|
| 4 | Excellent — thorough, correct, well-communicated |
| 3 | Good — mostly correct with minor gaps |
| 2 | Adequate — the idea is there but with notable gaps or errors |
| 1 | Partial — attempted but substantially incomplete or incorrect |
| 0 | Missing or entirely incorrect |

---

## 1. Research Question & Data (4 pts)

| Criterion | Weight |
|-----------|--------|
| Question is specific, answerable, and economically motivated | 1 pt |
| Data source is clearly identified and appropriate for the question | 1 pt |
| Variables are described with types and roles (feature / target / instrument) | 1 pt |
| Data quality issues are acknowledged and handled (missings, bias, outliers) | 1 pt |

---

## 2. Causal Inference Block (4 pts)

| Criterion | Weight |
|-----------|--------|
| A causal graph (DAG) is constructed and the assumed relationships are justified | 1 pt |
| Identification strategy is appropriate (backdoor, IV, or propensity score) | 1 pt |
| Estimation is implemented correctly using DoWhy or equivalent | 1 pt |
| At least one refutation test is run and its result is interpreted | 1 pt |

---

## 3. Supervised Learning Block (4 pts)

| Criterion | Weight |
|-----------|--------|
| Model choice is justified relative to the prediction task | 1 pt |
| Train/test split and cross-validation are used correctly | 1 pt |
| An appropriate metric is reported and interpreted (RMSE, AUC, accuracy, …) | 1 pt |
| Results are compared to a baseline or alternative model | 1 pt |

---

## 4. Unsupervised / Generative Block (4 pts)

| Criterion | Weight |
|-----------|--------|
| Method choice is justified relative to the structure of the data or task | 1 pt |
| Implementation is correct (e.g. k selection, linkage choice, latent dim) | 1 pt |
| Output is evaluated with an appropriate measure (silhouette, reconstruction loss, …) | 1 pt |
| Findings are visualised and interpreted in domain terms | 1 pt |

---

## 5. Synthesis & Communication (4 pts)

| Criterion | Weight |
|-----------|--------|
| The three method blocks are connected — each result informs the next | 1 pt |
| Conclusions directly answer the research question | 1 pt |
| Limitations and potential confounders are honestly discussed | 1 pt |
| Notebook is readable: clear markdown narrative, labelled plots, no dead code | 1 pt |

---

## Proposal vs. Final Submission

The same notebook serves as both proposal and final submission.

| Stage | What is assessed | Deadline |
|-------|-----------------|----------|
| **Proposal** | Sections 1–6 complete; research question approved | *(set by instructor)* |
| **Final** | Full notebook including Sections 7–8 | *(set by instructor)* |

The proposal is not separately graded but **must be approved** before the team proceeds.  
Feedback on the proposal will be given within one week of submission.

---

## Academic Integrity

- All external data sources, code snippets, and references must be cited in the notebook.
- Use of LLMs (ChatGPT, Copilot, etc.) is permitted for assistance but must be disclosed in a short note at the top of the notebook. The analysis, interpretation, and conclusions must be the team's own work.
