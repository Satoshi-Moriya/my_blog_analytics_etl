{{
  config(
    materialized='view',
    alias='stg_googleanalytics_events',
    schema='staging'
  )
}}

select * from {{ source(env_var('DBT_BIGQUERY_DATASET'), 'events_20*') }}
