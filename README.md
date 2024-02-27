# Fedex Analytics Engineering Assessment Submission

This is my submission for the FedEx assignment for Analytics Engineering.

## Overview

Quick reference:

- `transform/models`: Data models.
- `transform/results`: Results of the application as .csv files.

### Naming conventions for data models

- natural key columns are suffixed as `code`
- surrogate key columns are suffixed as `id`

## Running the demo

To run this demo:

1. Open this repo in VSCode. Open the command palette (Shift+Cmd+P on mac) and select "Dev Containers: Rebuild and Reopen in Container".
2. Open the command palette (Shift+Cmd+P on mac) and select "Markdown: Open preview to the side" to read this doc.
3. Open a terminal and run:

```sh
task demo:run-full-demo
```

To see an overview of the data assets:

1. Access the data catalog (dbt docs) by navigating to [http://localhost:8080](http://localhost:8080) from your browser

To use Cube:

http://localhost:4000/

To use Superset:

http://localhost:8080/login/

admin, admin
