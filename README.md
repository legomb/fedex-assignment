# Fedex Analytics Engineering Assessment

## Overview

This is my submission for the FedEx Analytics Engineering Assessment.

It includes a workflow with:

- Data transformations using [dbt](https://www.getdbt.com/)
- Data storage using [DuckDB](https://duckdb.org/)
- Semantic Layer models using [cube.dev](https://cube.dev/)
- BI dashboards using [Superset](https://superset.apache.org/)
- A basic data catalog using [dbt docs](https://docs.getdbt.com/docs/collaborate/documentation)
- A local development environment using vscode devcontainer, linters, docker compose.

### Notes

Due to time constraints, the following areas are incomplete:

- Superset works and has a connection to cube, so it can be used to create dashboards. But there are no readymade dashboards included in this repo.
- Devcontainer linters are not configured.
- Limited data cleansing and testing.

## Quick reference

- `REQUIREMENTS.md`: Original requirements.
- `transform/models`: Data transformation models (dbt).
- `cube/schema`: Semantic Layer models, to be used by BI dashboard apps (Cube.dev)
- `superset`: Superset (BI dashboards)
- `docker-compose.yml`: Local environment definition.
- `pyspark_sample/popular_styles_per_city.py`: This is how the `transform/models/dwh/sales/fct_popular_styles_categories_per_city.sql` dbt model would look in pyspark. Due to time constraints, this is a non-working, untested sample.
- `taskfile.yml`: Available actions, to be used by maintainers and eventually the CI/CD.

## Requirements

- Visual Studio Code
- Docker

## How to run this demo

1. Open this repo in VSCode. Open the command palette (Shift+Cmd+P on mac) and select "Dev Containers: Rebuild and Reopen in Container". This will spin up the environment including a devcontainer, cube, and superset.
2. Open a terminal in the devcontainer and run:

```sh
task demo:run-full-demo
```

Then:

- To view and manage the semantic model data cubes and views, open the local cube instance by navigating to [http://localhost:4000/](http://localhost:4000/).
- To view and manage BI dashboards, open the local Superset instance by navigating to [http://localhost:8080/login/](http://localhost:8080/login/) and log in with `admin`, `admin`. It has a connection to cube and you can create your own dashboards, but at the moment there are no readymade dashboards included in this repo.
- To see an overview of the data transformation models and their metadata & lineage, access the local dbt docs instance by navigating to [http://localhost:8080](http://localhost:8080).
