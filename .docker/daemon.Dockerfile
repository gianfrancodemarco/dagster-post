FROM python:3.12-slim as base

RUN pip install \
    dagster \
    dagster-graphql \
    dagster-webserver \
    dagster-postgres

    ENV DAGSTER_HOME=/opt/dagster/dagster_home/

RUN mkdir -p $DAGSTER_HOME
COPY workspace.yaml dagster.yaml $DAGSTER_HOME

WORKDIR $DAGSTER_HOME

ENTRYPOINT [ "dagster-daemon", "run"]