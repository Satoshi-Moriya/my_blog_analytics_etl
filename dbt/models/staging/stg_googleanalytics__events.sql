{{
  config(
    materialized='view',
    alias='stg_googleanalytics_events',
    schema='staging'
  )
}}

select * from {{ source('analytics_391322470', 'events_20*') }}