{{
  config(
    materialized='table',
    alias='int_blog_pv',
    schema='intermediate'
  )
}}

with

googleanalytics_events_log as (
    select * from {{ ref('stg_googleanalytics__events') }}
)

select
    user_pseudo_id as user_id,
    datetime(timestamp_micros(event_timestamp),  "Asia/Tokyo") as event_time_jst,
    geo.country as country
from googleanalytics_events_log
where event_name = 'page_view'