with
    sales_order_detail_data as (
        select
            sales_order_id
            , sales_order_detail_id
            , product_id
            , special_offer_id
            , carrier_tracking_number
            , order_qty
            , unit_price
            , unit_price_discount
            , row_guid
            , modified_date
        from {{ ref('stg_aw_sales_order_detail') }}
    )
    
    , fct_sales_order_detail as (
        select
            sales_order_id
            , sales_order_detail_id
            , product_id
            , special_offer_id
            , carrier_tracking_number
            , order_qty
            , unit_price
            , unit_price_discount
            , row_guid
            , modified_date
        from sales_order_detail_data
    )

select *
from fct_sales_order_detail
