FROM python:3.11-slim

ENV DBT_HOME=/usr/app/dbt

WORKDIR $DBT_HOME

COPY dbt_project.yml profiles.yml packages.yml* ./
COPY models/ ./models/
COPY macros/ ./macros/
COPY seeds/ ./seeds/
COPY tests/ ./tests/



RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir dbt-core dbt-postgres



RUN dbt deps


CMD ["dbt", "run"]
