with
    source as (
        select 
            cast(productid as int) as product_id
            , cast(locationid as int) as location_id
            , cast(shelf as varchar) as shelf
            , cast(bin as int) as bin
            , cast(quantity as int) as store_quantity
        from {{ source('adventureworks', 'productinventory') }}
    )

select *
from source
