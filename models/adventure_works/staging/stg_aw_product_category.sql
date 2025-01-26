with
    source as (
        select 
             cast(productcategoryid as int) as product_category_id
            , cast(name as varchar) as product_category_name
        from {{ source('adventureworks', 'productcategory') }}
    )

select *
from source
