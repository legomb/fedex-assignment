FROM mcr.microsoft.com/vscode/devcontainers/python:3.11

ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid $USER_GID vscode && usermod --uid $USER_UID --gid $USER_GID vscode; fi

RUN pwd
RUN ls
RUN pip3 install --upgrade pip
# COPY src/requirements.txt /tmp/
# RUN pip3 install --requirement /tmp/requirements.txt
RUN pip3 install dbt-duckdb sqlfluff sqlfluff-templater-dbt
