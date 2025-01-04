with
    customers as (
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
            customer_id
            , person_id
            , store_id
            , territory_id
            , row_guid
            , modified_date
        from customers
    )

select *
from dim_customer
