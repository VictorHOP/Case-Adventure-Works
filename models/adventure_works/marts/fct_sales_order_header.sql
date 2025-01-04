with
    sales_order_header_data as (
        select
            sales_order_id
            , revision_number
            , order_date
            , due_date
            , ship_date
            , status
            , online_order_flag
            , purchase_order_number
            , account_number
            , customer_id
            , salesperson_id
            , territory_id
            , bill_to_address_id
            , ship_to_address_id
            , ship_method_id
            , credit_card_id
            , credit_card_approval_code
            , currency_rate_id
            , subtotal
            , tax_amount
            , freight
            , total_due
            , comment
            , row_guid
            , modified_date
        from {{ ref('stg_aw_sales_order_header') }}
    )
    
    , fct_sales_order_header as (
        select
            sales_order_id
            , revision_number
            , order_date
            , due_date
            , ship_date
            , status
            , online_order_flag
            , purchase_order_number
            , account_number
            , customer_id
            , salesperson_id
            , territory_id
            , bill_to_address_id
            , ship_to_address_id
            , ship_method_id
            , credit_card_id
            , credit_card_approval_code
            , currency_rate_id
            , subtotal
            , tax_amount
            , freight
            , total_due
            , comment
            , row_guid
            , modified_date
        from sales_order_header_data
    )

select *
from fct_sales_order_header
