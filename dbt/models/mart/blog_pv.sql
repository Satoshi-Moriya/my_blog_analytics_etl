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
  country
  , date(event_time_jst) as `date`
  , count(*) as pv_count
from int_blog_pv
group by country, `date`
