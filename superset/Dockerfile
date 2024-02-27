# FROM apache/superset:3.0.4
FROM apache/superset:latest

ARG SUPERSET_ADMIN
ARG SUPERSET_PASSWORD
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_HOST
ARG POSTGRES_DB
ARG POSTGRES_PORT
ARG POSTGRES_CONN_NAME
ARG SUPERSET_SECRET_KEY

# Switch to root to install the required packages
USER root
# COPY --chown=superset:superset ./superset/assets .
RUN pip install psycopg2-binary==2.9.9
RUN pip install duckdb-engine==0.11.1
RUN pip install duckdb==0.10.0
USER superset
RUN superset fab create-admin \
	--username ${SUPERSET_ADMIN} \
	--firstname Superset \
	--lastname Admin \
	--email admin@example.com \
	--password ${SUPERSET_PASSWORD}
RUN superset db upgrade
RUN superset init
# RUN superset set_database_uri -d FedEx_Cube -u postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@fedex_cube:15432/test
RUN superset set_database_uri -d ${POSTGRES_CONN_NAME} -u postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
# RUN superset set_database_uri -d DW  -u duckdb:///superset_home/db/dev.duckdb
# RUN superset import-dashboards -p ./dashboard.zip -u ${SUPERSET_ADMIN}
