with
    product_inventory_data as (
        select 
            product_id
            , location_id
            , shelf
            , bin
            , store_quantity
        from {{ ref('stg_aw_product_inventory') }}
    ),

    aggregated_inventory as (
        select
            product_id,
            sum(store_quantity) as store_quantity
        from product_inventory_data
        group by product_id
    )

select *
from aggregated_inventory
