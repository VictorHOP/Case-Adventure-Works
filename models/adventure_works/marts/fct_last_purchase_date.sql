with last_purchase_date as (
    select
        customer_id
        , max(order_date) as last_order_date
    from {{ ref('fct_sales_order_header') }}
    group by customer_id
)

select *
from last_purchase_date
