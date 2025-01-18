with
    dim_person as (
        select
            business_entity_id
            , person_sk
            , full_name
        from {{ ref('dim_person') }}
    )

    , dim_sales_territory as (
        select
            territory_id
            , territory_sk
        from {{ ref('dim_sales_territory') }}
    )

    , customers as (
        select 
            customer_id
            , person_id
            , store_id
            , territory_id
            , row_guid
            , modified_date
        from {{ ref('stg_aw_customer') }}
    )

    , dim_customer as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'customer_id'
                ])
            }} as customer_sk
            , dim_person.person_sk as person_fk
            , dim_sales_territory.territory_sk as territory_fk
            , customer_id
            , person_id
            , store_id
            , dim_sales_territory.territory_id
            , dim_person.full_name
            , row_guid
            , modified_date
        from customers
        left join dim_person
            on dim_person.business_entity_id = customers.person_id
        left join dim_sales_territory
            on dim_sales_territory.territory_id = customers.territory_id
    )

select *
from dim_customer
