#! /bin/bash

set -eux
echo "Starting dbt run..."
dbt run
echo "dbt run completed."