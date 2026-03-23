# Copilot Instructions

## Repository Purpose

Teaching repository for the **Data & AI in Economics** Master's course at TU Dortmund University. Materials cover causal inference, supervised/unsupervised learning, and deep learning — primarily delivered as Jupyter Notebooks.

## Environment Setup

Uses [UV](https://docs.astral.sh/uv/) for dependency management. Python 3.14 required.

```bash
uv sync          # install all dependencies
uv run jupyter notebook  # launch Jupyter
```

There are no build, test, or lint commands — notebooks are the primary artifact.

## Key Dependencies

`pandas`, `numpy`, `scikit-learn`, `keras`, `matplotlib`, `plotly`, `seaborn`, `statsmodels`, `openai`, `dowhy`, `networkx`, `mglearn`, `empiricaldist`, `graphviz`, `beautifulsoup4`, `newsapi-python`, `wrds`

## Repository Structure

```
lectures/           # Main lecture notebooks (00–05) + intros/ (8 tutorial notebooks)
exercises/          # Student-facing notebooks + solution notebooks
assets/             # PNG diagrams referenced in notebooks
data/               # Datasets (CSV, Excel, HDF5) used in notebooks
lectures.md         # Index of all lecture and exercise materials with links
literature.md       # Curated reading list by topic
```

## Naming Conventions

- **Notebooks**: `[NN]_[Topic].ipynb` for lectures, `[NN]_[Topic]_students version.ipynb` / `[NN]_[Topic]_solution.ipynb` for exercises
- **Intro tutorials**: `intros/[NNN]_Intro_to_[topic].ipynb`
- Snake_case for Python variables and functions

## Content Patterns

- Each main lecture topic (02–05) has a paired exercise notebook with a "students version" (blanked-out code cells) and a solution.
- `lectures.md` is the canonical index — update it when adding new notebooks or Google Colab links.
- `assets/` images are embedded in notebooks using relative paths like `../assets/filename.png`.
- Data files in `data/` are referenced from `lectures/` as `../data/filename` and from `lectures/intros/` as `../../data/filename`.

## GitHub Pages

The `pages` branch deploys to GitHub Pages via Jekyll (`.github/workflows/jekyll-gh-pages.yml`). Push to `pages` to update the course website; do not modify the workflow unless changing the deployment target.

