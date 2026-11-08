FROM python:3.11-slim

ENV DBT_HOME=/usr/app/dbt
ENV APPLICATION_NAME="dbt-elt-superstore"
ENV APPLICATIOB_HOME=${DBT_HOME}/${APPLICATION_NAME}
ENV APPLICATION_OPTIONS="--profiles-dir profiles"

WORKDIR ${APPLICATIOB_HOME}

COPY . ${APPLICATIOB_HOME}

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt


ENTRYPOINT ["sh", "-c", "dbt run ${APPLICATION_OPTIONS}"]
