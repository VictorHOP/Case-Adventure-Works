with
    source as (
        select 
            cast(productsubcategoryid as int) as product_subcategory_id
            , cast(productcategoryid as int) as product_category_id
            , cast(name as varchar) as product_subcategory_name
        from {{ source('adventureworks', 'productsubcategory') }}
    )

select *
from source
