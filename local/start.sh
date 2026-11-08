#!/bin/bash

echo "Run project ..."
docker compose up --build -d

echo "Project logs"
docker compose logs -f