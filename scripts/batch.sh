#! /bin/bash

set -eux
echo "Starting dbt run..."
dbt run --profiles-dir .
echo "dbt run completed."