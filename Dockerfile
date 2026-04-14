FROM python:3.12-slim

# System dependencies:
#   graphviz        - required by graphviz Python package (causal graphs)
#   libhdf5-dev     - required by tables (PyTables / HDF5 data files)
#   gcc/build-essential - required by dowhy and other packages with C extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
        graphviz \
        libhdf5-dev \
        gcc \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/jovyan

# Install JupyterLab and course dependencies.
# TensorFlow and Keras are intentionally excluded to keep the image lightweight (~1 GB).
# Deep-learning notebooks (05a / 05b) require a local install with `uv sync`.
COPY requirements.txt .
RUN pip install --no-cache-dir jupyterlab \
    && grep -viE "^tensorflow|^keras" requirements.txt \
       | pip install --no-cache-dir -r /dev/stdin \
    && rm requirements.txt

# Copy course materials
COPY lectures/ ./lectures/
COPY exercises/ ./exercises/
COPY data/ ./data/
COPY assets/ ./assets/

# Writable directory for student work (mount a host folder here to persist changes)
RUN mkdir -p work

EXPOSE 8888

CMD ["jupyter", "lab", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--allow-root", \
     "--ServerApp.token=", \
     "--ServerApp.password=", \
     "--notebook-dir=/home/jovyan"]
