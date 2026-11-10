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
    libc-bin \
    && iconv -f WINDOWS-1252 -t UTF-8 seeds/superstore.csv -o seeds/superstore.csv.tmp \
    && mv seeds/superstore.csv.tmp seeds/superstore.csv \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

RUN dbt deps

ENTRYPOINT ["sh", "-c", "dbt seed ${APPLICATION_OPTIONS} \
&& dbt run ${APPLICATION_OPTIONS}"]
