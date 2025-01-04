with
    dim_person as (
        select
            business_entity_id
            , person_sk
        from {{ ref('dim_person') }}
    )

    , dim_customer as (
        select
            customer_id
            , customer_sk
        from {{ ref('dim_customer') }}
    )

    , dim_sales_territory as (
        select
            territory_id
            , territory_sk
        from {{ ref('dim_sales_territory') }}
    )

    , sales_order_header_data as (
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
            {{
                dbt_utils.generate_surrogate_key([ 
                    'sales_order_id'
                ])
            }} as sales_order_sk
            , dim_person.person_sk as salesperson_fk
            , dim_customer.customer_sk as customer_fk
            , dim_sales_territory.territory_sk as territory_fk
            , sales_order_id
            , salesperson_id
            , dim_customer.customer_id
            , dim_sales_territory.territory_id
            , revision_number
            , order_date
            , due_date
            , ship_date
            , status
            , online_order_flag
            , purchase_order_number
            , account_number
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
        left join dim_person
            on dim_person.business_entity_id = sales_order_header_data.salesperson_id
        left join dim_customer
            on dim_customer.customer_id = sales_order_header_data.customer_id
        left join dim_sales_territory
            on dim_sales_territory.territory_id = sales_order_header_data.territory_id
    )

select *
from fct_sales_order_header
