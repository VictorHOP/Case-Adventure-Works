with
    sales_reason_header_data as (
        select
            sales_order_id
            , sales_reason_id
            , modified_date
        from {{ ref('stg_aw_sales_reason_header') }}
    )
    
    , fct_sales_reason as (
        select
            sales_order_id
            , sales_reason_id
            , modified_date
        from sales_reason_header_data
    )

select *
from fct_sales_reason
