# Project entrypoint

## How to use
  + `setup-venv-extra` create python virtual environment (requres access to gitlab)
  + `source .venv/bin/activate` activate virtual environment
  + see `notebooks` for examples

## Lint code and run unit tests
  + `make lint`
  + `make test`

## Generate sphinx documentation
  + `make docs` (runs linting, and unit tests as well)
    + open `docs/sphinx/build/html/index.html`

## Jupyter notebooks
  + Jupyter notebooks should be stored only in the `notebooks` directory
  + **IMPORTANT**: Only clean notebooks should be committed (i.e., without
    evaluated cells)
