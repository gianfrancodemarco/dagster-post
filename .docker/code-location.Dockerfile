FROM python:3.12-slim as base

RUN pip install \
    dagster \
    dagster-postgres

ENV DAGSTER_HOME=/opt/dagster/dagster_home

RUN mkdir -p $DAGSTER_HOME

COPY dagster.yaml $DAGSTER_HOME

WORKDIR /opt/dagster/app
RUN pip install debugpy

## Install only the dependencies, then the package. If the source changes the dependencies layer is not rebuilt
COPY src /opt/dagster/app

# Run dagster gRPC server on port 4000
EXPOSE 4000
CMD ["dagster", "code-server", "start", "-h", "0.0.0.0", "-p", "4000", "-m", "defs"]