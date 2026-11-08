FROM python:3.11-slim

ENV DBT_HOME=/usr/app/dbt
ENV APPLICATION_NAME="dbt-elt-superstore"
ENV APPLICATIOB_HOME=${DBT_HOME}/${APPLICATION_NAME}

WORKDIR ${APPLICATIOB_HOME}

COPY . ${APPLICATIOB_HOME}

RUN pip install --no-cache-dir -r requirements.txt


CMD ["python", "main.py"]
