with
    dim_person as (
        select
            business_entity_id
            , person_sk
            , full_name
            , email_promotion
        from {{ ref('dim_person') }}
    )

    , dim_sales_territory as (
        select
            territory_id
            , territory_sk
        from {{ ref('dim_sales_territory') }}
    )

    , last_purchase_date as (
        select
            customer_id,
            max(order_date) as last_order_date
        from {{ ref('fct_sales_order_header') }}
        group by customer_id
    )

    , customers as (
        select 
            customer_id
            , person_id
            , store_id
            , territory_id
        from {{ ref('stg_aw_customer') }}
    )

    , dim_customer as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'customers.customer_id'
                ])
            }} as customer_sk
            , dim_person.person_sk as person_fk
            , dim_sales_territory.territory_sk as territory_fk
            , customers.customer_id
            , person_id
            , store_id
            , dim_sales_territory.territory_id
            , dim_person.full_name
            , case 
                when dim_person.email_promotion = 0 then 'Não Inscrito'
                when dim_person.email_promotion = 1 then 'Inscrição Básica'
                when dim_person.email_promotion = 2 then 'Inscrição Avançada'
            end as email_promotion
            , last_order_date
            , case
                when datediff(day, last_purchase_date.last_order_date, '2014-06-30') <= 90 then 'Compra Recente - até 3 meses'
                when datediff(day, last_purchase_date.last_order_date, '2014-06-30') between 91 and 180 then 'Compra Moderada - até 6 meses'
                when datediff(day, last_purchase_date.last_order_date, '2014-06-30') > 180 then 'Compra Antiga - mais de 6 meses'
                else 'Sem Compras'
            end as last_purchase
        from customers
        left join dim_person
            on dim_person.business_entity_id = customers.person_id
        left join dim_sales_territory
            on dim_sales_territory.territory_id = customers.territory_id
        left join last_purchase_date
            on last_purchase_date.customer_id = customers.customer_id
    )

select *
from dim_customer
