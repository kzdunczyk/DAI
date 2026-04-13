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

## Python Version & Environment

Switched project from Python 3.14 to **Python 3.12** to resolve fundamental incompatibilities:

- `dowhy 0.14` requires `Python < 3.14`
- `tables` (HDF5) fails to compile from source under GCC 15 / C23 on Python 3.14
- Python 3.12 has pre-built wheels for all dependencies

Added **TensorFlow** (`>=2.16.0,<3`) as an explicit dependency to provide the Keras 3 backend.

Regenerated `requirements.txt` with `uv export --no-hashes` — the previous hash-pinned format caused pip hash-mismatch errors on Colab (different platform/Python version).

**Files changed:** `.python-version`, `pyproject.toml`, `uv.lock`, `requirements.txt`

---

## Notebook Runtime Fixes

All notebooks were executed end-to-end and the following runtime errors were found and fixed:

### `lectures/00_Intro.ipynb`
- **Broken external URL** — `http://tools.openlab.psu.edu/publicData/ANSUR_II_MALE_Public.csv` now returns an HTML page. The ANSUR II dataset was downloaded from the Wayback Machine and committed to `data/`. The notebook now loads from `../data/` with a GitHub raw URL fallback for Colab.

### `lectures/02_CausalInference.ipynb`
- **NumPy 2.x incompatibility in dowhy** — `dowhy.datasets.linear_dataset()` uses `np.vectorize` on functions that returned 1-element arrays (`choice([0,1], 1, ...)`). NumPy 2.0 requires vectorized functions to return scalars. Added a monkey-patch at the top of the first code cell to replace `convert_to_binary` and `stochastically_convert_to_three_level_categorical` with scalar-returning versions.

### `lectures/04_Intro_to_numpy.ipynb` → `lectures/intros/004_Intro_to_numpy.ipynb`
- **Deprecated NumPy 2.0 constants** — `np.NAN`, `np.NINF`, `np.NZERO`, `np.PZERO` were removed in NumPy 2.0. Replaced with `float('nan')`, `-np.inf`, `-0.0`, `+0.0`.

### `lectures/05a_deep_learning.ipynb`
- Added `os.environ["KERAS_BACKEND"] = "tensorflow"` before keras imports (required for Keras 3 on Colab where the backend is not auto-detected).

### `lectures/05b_deep_learning.ipynb`
- **`np.prod()` returns `numpy.int64`** — Keras 3's `Dense` layer requires a plain Python `int` for `units`. Wrapped `np.prod(shape_before_flattening)` with `int(...)`.
- Added `os.environ["KERAS_BACKEND"] = "tensorflow"` before keras imports.
- Reduced VAE training from `epochs=10` to `epochs=2` for CPU execution (Colab users with GPU can increase this).

**New data files committed:** `data/ANSUR_II_MALE_Public.csv`, `data/ANSUR_II_FEMALE_Public.csv`

---

## lectures.md Link Fixes

- **Intro notebook links** — all 7 links used wrong case (`001_intro_to_jupyter.ipynb` → `001_Intro_to_jupyter.ipynb`). Fixed to match actual filenames.
- **Missing notebook** — `008_3D_yield_curve.ipynb` was not linked. Added.
- **Broken exercise link** — `exercises/02_CausalInference.ipynb` does not exist; actual file is `exercises/02_CausalInference_students version.ipynb`. Fixed with URL-encoded path.
- **Missing exercise links** — Sections 3, 4, and 5 had no exercise links despite exercise notebooks existing. Added Colab links for all 6 missing exercise notebooks.

---

## Notebooks Verified (executed end-to-end, no errors)

| Notebook | Status |
|---|---|
| `lectures/00_Intro.ipynb` | ✓ |
| `lectures/01_Paradoxon.ipynb` | ✓ |
| `lectures/02_CausalInference.ipynb` | ✓ |
| `lectures/03a_supervised_learning.ipynb` | ✓ |
| `lectures/03b_supervised_learning.ipynb` | ✓ |
| `lectures/03c_supervised_learning.ipynb` | ✓ |
| `lectures/04_unsupervised_learning.ipynb` | ✓ |
| `lectures/05a_deep_learning.ipynb` | ✓ |
| `lectures/05b_deep_learning.ipynb` | ✓ |
| `lectures/intros/001_Intro_to_jupyter.ipynb` | ✓ |
| `lectures/intros/002_Intro_to_python.ipynb` | ✓ |
| `lectures/intros/003_Intro_to_pandas.ipynb` | ✓ |
| `lectures/intros/004_Intro_to_numpy.ipynb` | ✓ |
| `lectures/intros/005_Intro_to_matplotlib.ipynb` | ✓ |
| `lectures/intros/006_Intro_to_scipy.ipynb` | — (requires WRDS login) |
| `lectures/intros/007_Intro_to_web_scraping.ipynb` | — (requires NewsAPI key) |
| `lectures/intros/008_3D_yield_curve.ipynb` | ✓ |
| `exercises/02_CausalInference_students version.ipynb` | ✓ |
| `exercises/02_CausalInference_solution.ipynb` | ✓ |
| `exercises/03a_supervised_learning_students version.ipynb` | ✓ |
| `exercises/03b_supervised_learning_students version.ipynb` | ✓ |
| `exercises/03c_supervised_learning_students version.ipynb` | ✓ |
| `exercises/04_unsupervised_learning_students version.ipynb` | ✓ |
| `exercises/05a_deep_learning_students version.ipynb` | ✓ |
| `exercises/05b_deep_learning_students version.ipynb` | ✓ |

---

## Exercise Notebook Fixes

### `exercises/02_CausalInference_students version.ipynb` and `solution.ipynb`
- **Missing dependency** — `openpyxl` not installed; required by pandas to read `.xlsx` files. Added `openpyxl>=3.1.0,<4` to `pyproject.toml`. Regenerated `requirements.txt`.

### `exercises/03b_supervised_learning_students version.ipynb`
- **Missing import** — `pandas` was never imported. The `prep_data(df: pd.DataFrame)` function definition failed with `NameError: name 'pd' is not defined`. Added `import pandas as pd` to the imports cell.

### `exercises/05a_deep_learning_students version.ipynb`
- Replaced `!pip install keras` / `!pip install tensorflow` with the standard `requirements.txt` install.
- Added `os.environ["KERAS_BACKEND"] = "tensorflow"` before keras imports.
- Fixed `from tensorflow.keras import layers, Model` → `from keras import layers, Model`.

### `exercises/05b_deep_learning_students version.ipynb`
- **Student template** — filled in all exercise blanks (`___`) to produce an executable notebook.
- Fixed hardcoded `os.chdir('/home/jovyan/work/DAI')` with dynamic path detection (works locally and on Colab).
- Fixed `from tensorflow import keras` / `from tensorflow.keras import` → `from keras import` (Keras 3).
- Fixed `keras.backend.exp` → `keras.ops.exp` (Keras 3 removed `keras.backend` functional API).
- Reduced GAN iterations from 10 000 to 200 and VAE epochs from 50 to 2 for CPU execution; comments note how to increase for GPU runs.

---

## GPU / CUDA Status

Local machine has an NVIDIA RTX A4000 with CUDA driver 13.0 installed. TensorFlow 2.21 requires **CUDA 12.5** (`libcudart.so.12`) and **cuDNN 9** — neither present.

**Sysadmin action needed to enable GPU training locally:**
```
sudo dnf install cuda-toolkit-12-5 libcudnn9-cuda-12
```
Or install CUDA 12.5 alongside the existing CUDA 13 install and set `LD_LIBRARY_PATH` accordingly. Until then, all notebooks run on CPU with reduced epoch counts.
