with recursive date_range as (
    select 
        (select min(order_date) from {{ ref('stg_aw_sales_order_header') }}) as date
    union all
    select 
        date + interval '1 day'
    from date_range
    where date < (select max(order_date) from {{ ref('stg_aw_sales_order_header') }})
)

select
    date as raw_date
    , extract(year from date) as year
    , extract(month from date) as month
    , extract(day from date) as day
    , extract(week from date) as week
from date_range
