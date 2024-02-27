# FROM apache/superset:3.0.4
FROM apache/superset:latest

ARG SUPERSET_ADMIN
ARG SUPERSET_PASSWORD
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG SUPERSET_SECRET_KEY
# Switch to root to install the required packages
USER root
# COPY --chown=superset:superset ./superset/assets .
RUN pip install psycopg2-binary==2.9.9
RUN pip install duckdb-engine==0.11.1
RUN pip install duckdb==0.10.0
USER superset
# RUN superset fab create-admin \
# 	--username ${SUPERSET_ADMIN} \
# 	--firstname Superset \
# 	--lastname Admin \
# 	--email admin@example.com \
# 	--password ${SUPERSET_PASSWORD}
RUN superset fab create-admin \
	--firstname Superset \
	--lastname Admin \
	--email admin@superset.com \
	--username admin \
	--password admin
RUN superset db upgrade
RUN superset init
# RUN superset set_database_uri -d OLTP  -u postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@oltp:5432/sales_oltp
RUN superset set_database_uri -d DW  -u duckdb:///superset_home/db/dev.duckdb
# RUN superset import-dashboards -p ./dashboard.zip -u ${SUPERSET_ADMIN}
