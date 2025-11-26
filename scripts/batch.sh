#! /bin/bash

set -aeux
source ../.env

echo "Starting dbt run..."
dbt run --profiles-dir .
echo "dbt run completed."