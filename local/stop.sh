#!/bin/bash

echo "Stop project ..."
docker compose down

echo "Stop database ..."
docker compose -f compose.postgres.yaml down