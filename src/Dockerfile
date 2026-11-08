FROM python:3.11-slim

ENV DBT_HOME=/usr/app/dbt

WORKDIR $DBT_HOME

COPY macros/ macros/
COPY models/ models/
COPY profiles/ profiles/
COPY seeds/ seeds/
COPY tests/ tests/
COPY dbt_project.yml dbt_project.yml
COPY requirements.txt requirements.txt
COPY main.py main.py


RUN pip install --no-cache-dir -r requirements.txt


CMD ["python", "main.py"]
