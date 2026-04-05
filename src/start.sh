#!/bin/bash

set -a
source .env
set +a

echo "Run dbt command"
dbt run --profiles-dir profiles