{{
  config(
    materialized='table',
    alias='blog_pv',
    schema='mart'
  )
}}

with

int_blog_pv as (
    select * from {{ ref('int_blog_pv') }}
)

select
    date(event_time_jst) as date,
    country,
    count(*) as pv_count
from int_blog_pv
group by 1, 2