with
    source as (
        select 
            cast(productid as int) as product_id
            , cast(name as varchar) as product_name
            , cast(productnumber as varchar) as product_number
            , cast(makeflag as boolean) as make_flag
            , cast(finishedgoodsflag as boolean) as finished_goods_flag
            , cast(color as varchar) as product_color
            , cast(safetystocklevel as int) as safety_stock_level
            , cast(reorderpoint as int) as reorder_point
            , cast(standardcost as float) as standard_cost
            , cast(listprice as float) as list_price
            , cast(size as varchar) as product_size
            , cast(sizeunitmeasurecode as varchar) as size_unit_measure_code
            , cast(weightunitmeasurecode as varchar) as weight_unit_measure_code
            , cast(weight as float) as product_weight
            , cast(daystomanufacture as int) as days_to_manufacture
            , cast(productline as varchar) as product_line
            , cast(class as varchar) as product_class
            , cast(style as varchar) as product_style
            , cast(productsubcategoryid as int) as product_subcategory_id
            , cast(productmodelid as int) as product_model_id
            , cast(sellstartdate as date) as sell_start_date
            , cast(sellenddate as date) as sell_end_date
            , cast(discontinueddate as varchar) as discontinued_date
            , cast(rowguid as varchar) as row_guid
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'product') }}
    )

select *
from source
