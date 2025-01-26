with
    dim_sales_reason as (
        select
            sales_reason_id
            , sales_reason_sk
        from {{ ref('dim_sales_reason') }}
    )

    , fct_sales_order_header as (
        select
            sales_order_id
            , sales_order_sk
        from {{ ref('fct_sales_order_header') }}
    )

    , sales_reason_header_data as (
        select
            sales_order_id
            , sales_reason_id
        from {{ ref('stg_aw_sales_reason_header') }}
    )

    , fct_sales_reason as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'fct_sales_order_header.sales_order_id',
                    'dim_sales_reason.sales_reason_id'
                ])
            }} as sales_reason_fact_sk
            , fct_sales_order_header.sales_order_sk as sales_order_fk
            , dim_sales_reason.sales_reason_sk as sales_reason_fk
            , fct_sales_order_header.sales_order_id
            , dim_sales_reason.sales_reason_id
        from sales_reason_header_data
        left join fct_sales_order_header
            on fct_sales_order_header.sales_order_id = sales_reason_header_data.sales_order_id
        left join dim_sales_reason
            on dim_sales_reason.sales_reason_id = sales_reason_header_data.sales_reason_id
    )

select *
from fct_sales_reason
