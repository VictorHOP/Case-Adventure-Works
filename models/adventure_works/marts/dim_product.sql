with
    products as (
        select 
            product_id
            , product_name
            , product_number
            , make_flag
            , finished_goods_flag
            , product_color
            , safety_stock_level
            , reorder_point
            , standard_cost
            , list_price
            , product_size
            , size_unit_measure_code
            , weight_unit_measure_code
            , product_weight
            , days_to_manufacture
            , product_line
            , product_class
            , product_style
            , product_subcategory_id
            , product_model_id
            , sell_start_date
            , sell_end_date
            , discontinued_date
            , row_guid
            , modified_date
        from {{ ref('stg_aw_product') }}
    )

    , dim_product as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'product_id'
                ])
            }} as product_sk
            , product_id
            , product_name
            , product_number
            , make_flag
            , finished_goods_flag
            , product_color
            , safety_stock_level
            , reorder_point
            , standard_cost
            , list_price
            , product_size
            , size_unit_measure_code
            , weight_unit_measure_code
            , product_weight
            , days_to_manufacture
            , product_line
            , product_class
            , product_style
            , product_subcategory_id
            , product_model_id
            , sell_start_date
            , sell_end_date
            , discontinued_date
            , row_guid
            , modified_date
        from products
    )

select *
from dim_product
