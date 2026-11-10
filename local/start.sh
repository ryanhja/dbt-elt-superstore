#!/bin/bash

echo "Run Database ..."
docker compose -f compose.postgres.yaml up -d

sleep 5

echo "Run Project ..."
docker compose up --build -d

echo "Project logs"
docker compose  -f compose.postgres.yaml -f compose.yaml logs -f