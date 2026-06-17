#! /bin/bash
set -aeux

cd /app/dbt

echo "== dbt deps =="
dbt deps

echo "== dbt run =="
dbt run --target ${DBT_TARGET}

echo "== dbt test =="
dbt test --target ${DBT_TARGET}