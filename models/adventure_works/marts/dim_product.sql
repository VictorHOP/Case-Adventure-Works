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
            products.product_id
            , products.product_name
            , products.product_number
            , products.make_flag
            , products.finished_goods_flag
            , products.product_color
            , products.safety_stock_level
            , products.reorder_point
            , products.standard_cost
            , products.list_price
            , products.product_size
            , products.size_unit_measure_code
            , products.weight_unit_measure_code
            , products.product_weight
            , products.days_to_manufacture
            , products.product_line
            , products.product_class
            , products.product_style
            , products.product_subcategory_id
            , products.product_model_id
            , products.sell_start_date
            , products.sell_end_date
            , products.discontinued_date
            , products.row_guid
            , products.modified_date
        from products
    )

select *
from dim_product
