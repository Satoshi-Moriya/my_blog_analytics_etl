{{
  config(
    materialized='table',
    alias='int_blog_per_page_pv',
    schema='intermediate'
  )
}}

with

googleanalytics_events_log as (
  select * from {{ ref('stg_googleanalytics__events') }}
)

select
  datetime(timestamp_micros(event_timestamp), "Asia/Tokyo") as event_time_jst
  , regexp_replace(
    (
      select value.string_value from unnest(event_params)
      where key = "page_location"
    ), r"\?.*", ""
  ) as page_location
from
  googleanalytics_events_log
where
  event_name = "page_view"
