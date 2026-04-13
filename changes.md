# Changes — April 2026

## Security Fixes

Addressed all open Dependabot security alerts by adding explicit minimum version constraints in `pyproject.toml` and regenerating `uv.lock` / `requirements.txt`.

| Package | Old version | New version | Alert | Severity |
|---|---|---|---|---|
| `cryptography` | 46.0.5 | 46.0.7 | Buffer overflow with non-contiguous buffers | Medium |
| `cryptography` | 46.0.5 | 46.0.7 | Incomplete DNS name constraint enforcement | Low |
| `Pygments` | 2.19.2 | 2.20.0 | Regular Expression Denial of Service (ReDoS) | Low |
| `requests` | 2.32.5 | 2.33.1 | Insecure temp file reuse in `extract_zipped_paths()` | Medium |
| `poetry` | 2.2.1 | 2.3.4 | Wheel path traversal leading to arbitrary file write | High |

**Files changed:** `pyproject.toml`, `uv.lock`, `requirements.txt`

---

## Notebook Fixes

Static analysis was performed on all 17 Jupyter notebooks in `lectures/` and `lectures/intros/`. Two notebooks contained deprecated TensorFlow/Keras API calls incompatible with Keras 3.x.

### `lectures/05a_deep_learning.ipynb`

- **Cell 25** — Replaced legacy Keras 2 / TensorFlow import:
  ```python
  # Before
  from tensorflow.keras import layers, Model
  # After
  from keras import layers, Model
  ```
  TensorFlow is not a project dependency; Keras 3.x is used as a standalone package.

### `lectures/05b_deep_learning.ipynb`

Keras 3.x removed the `keras.backend` functional API. All backend ops are now in `keras.ops`.

| Cell | Before | After |
|---|---|---|
| 1 | `import tensorflow as tf` | *(removed)* |
| 3 | `tf.random.normal(...)` | `keras.random.normal(...)` |
| 3 | `tf.shape(x)` | `keras.ops.shape(x)` |
| 3 | `tf.keras.backend.exp(x)` | `keras.ops.exp(x)` |
| 5, 7 | `tf.keras.backend.flatten(x)` | `keras.ops.reshape(x, (-1,))` |
| 5, 7 | `tf.keras.backend.mean(x, ...)` | `keras.ops.mean(x, ...)` |
| 5, 7 | `tf.keras.backend.square(x)` | `keras.ops.square(x)` |
| 5, 7 | `tf.keras.backend.exp(x)` | `keras.ops.exp(x)` |

**Files changed:** `lectures/05a_deep_learning.ipynb`, `lectures/05b_deep_learning.ipynb`

---

## Notebooks with No Issues

The following 15 notebooks passed static analysis without errors:

- `lectures/00_Intro.ipynb`
- `lectures/01_Paradoxon.ipynb`
- `lectures/02_CausalInference.ipynb`
- `lectures/03a_supervised_learning.ipynb`
- `lectures/03b_supervised_learning.ipynb`
- `lectures/03c_supervised_learning.ipynb`
- `lectures/04_unsupervised_learning.ipynb`
- `lectures/05a_deep_learning.ipynb` *(after fix)*
- `lectures/05b_deep_learning.ipynb` *(after fix)*
- `lectures/intros/001_Intro_to_jupyter.ipynb`
- `lectures/intros/002_Intro_to_python.ipynb`
- `lectures/intros/003_Intro_to_pandas.ipynb`
- `lectures/intros/004_Intro_to_numpy.ipynb`
- `lectures/intros/005_Intro_to_matplotlib.ipynb`
- `lectures/intros/006_Intro_to_scipy.ipynb`
- `lectures/intros/007_Intro_to_web_scraping.ipynb`
- `lectures/intros/008_3D_yield_curve.ipynb`
