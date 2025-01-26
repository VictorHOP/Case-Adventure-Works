with
    dim_product as (
        select
            product_id
            , product_sk
        from {{ ref('dim_product') }}
    )

    , fct_sales_order_header as (
        select
            sales_order_id
            , sales_order_sk
        from {{ ref('fct_sales_order_header') }}
    )

    , current_product_cost as (
        select
            product_id
            , standard_cost
        from {{ ref('fct_product_cost_history') }}
        where end_date is null
    )

    , sales_order_detail_data as (
        select
            sales_order_id
            , sales_order_detail_id
            , product_id
            , special_offer_id
            , carrier_tracking_number
            , order_qty
            , unit_price
            , unit_price_discount
        from {{ ref('stg_aw_sales_order_detail') }}
    )

    , fct_sales_order_detail as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'sales_order_detail_id'
                ])
            }} as sales_order_detail_sk
            , fct_sales_order_header.sales_order_sk as sales_order_fk
            , dim_product.product_sk as product_fk
            , dim_product.product_id
            , fct_sales_order_header.sales_order_id
            , sales_order_detail_id
            , special_offer_id
            , carrier_tracking_number
            , order_qty
            , unit_price
            , unit_price_discount
            , order_qty * (unit_price * (1-unit_price_discount)) as total_price
            , total_price / nullif(order_qty, 0) as ticket_medio
            , current_product_cost.standard_cost
        from sales_order_detail_data
        left join dim_product
            on dim_product.product_id = sales_order_detail_data.product_id
        left join fct_sales_order_header
            on fct_sales_order_header.sales_order_id = sales_order_detail_data.sales_order_id
        left join current_product_cost
            on current_product_cost.product_id = sales_order_detail_data.product_id
    )

select *
from fct_sales_order_detail
