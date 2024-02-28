# Fedex Analytics Engineering Assessment Submission

This is my submission for the FedEx assignment for Analytics Engineering.

## Overview

Quick reference:

- `transform/models`: Data transformation models (dbt).
- `cube/schema`: Semantic Layer models, to be used by BI dashboard apps (Cube.dev)
- `superset`: Superset (BI dashboards)
- `docker-compose.yml`: Local environment definition.
- `pyspark_sample/popular_styles_per_city.py`: This is how the `transform/models/dwh/sales/fct_amazon_popular_styles_categories_per_city.sql` dbt model would look in pyspark. Due to time constraints, this is a non-working, untested sample.

## Running the demo

To run this demo:

1. Open this repo in VSCode. Open the command palette (Shift+Cmd+P on mac) and select "Dev Containers: Rebuild and Reopen in Container".
2. Open the command palette (Shift+Cmd+P on mac) and select "Markdown: Open preview to the side" to read this doc.
3. Open a terminal and run:

```sh
task demo:run-full-demo
```

Then:

- To view and manage BI dashboards, open the local [Superset](https://superset.apache.org/) instance by navigating to [http://localhost:8080/login/](http://localhost:8080/login/) and log in with `admin`, `admin`.
- To see an overview of the data transformation models and their metadata & lineage, access the local [dbt docs](https://docs.getdbt.com/docs/collaborate/documentation) instance by navigating to [http://localhost:8080](http://localhost:8080) from your browser.
- To view and manage the semantic model data cubes and views, open the local [cube.dev](https://cube.dev/) instance by navigating to [http://localhost:4000/](http://localhost:4000/).

## Requirements

These are the questions we want to be able to address:

- Which product style and category are more popular in which city?
- What is the sales trend over seasons?
- What if I want to have some insights on the last period over sales and want to build a dashboard to report on this continuously?
