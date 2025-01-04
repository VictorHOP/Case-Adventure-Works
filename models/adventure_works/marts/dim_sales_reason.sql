with
    sales_reason_data as (
        select
            sales_reason_id
            , reason_name
            , reason_type
            , modified_date
        from {{ ref('stg_aw_sales_reason') }}
    )
    
    , dim_sales_reason as (
        select
            sales_reason_id
            , reason_name
            , reason_type
            , modified_date
        from sales_reason_data
    )

select *
from dim_sales_reason
