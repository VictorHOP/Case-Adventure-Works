with
    sales_reason_data as (
        select
            sales_reason_id
            , reason_name
            , reason_type
        from {{ ref('stg_aw_sales_reason') }}
    )
    
    , dim_sales_reason as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'sales_reason_id'
                ])
            }} as sales_reason_sk
            , sales_reason_id
            , reason_name
            , reason_type
        from sales_reason_data
    )

select *
from dim_sales_reason
