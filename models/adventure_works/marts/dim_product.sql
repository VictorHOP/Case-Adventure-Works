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
        from {{ ref('stg_aw_product') }}
    )

    , joins_product as (
        select
            products.*
            , psc.product_subcategory_name
            , pc.product_category_name
            , piventory.store_quantity
        from products
        left join {{ ref('stg_aw_product_subcategory') }} psc
            on products.product_subcategory_id = psc.product_subcategory_id
        left join {{ ref('stg_aw_product_category') }} pc
            on psc.product_category_id = pc.product_category_id
        left join {{ ref('agg_product_inventory') }} piventory
            on products.product_id = piventory.product_id
    )

    , dim_product as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'product_id'
                ] )
            }} as product_sk
            , product_id
            , product_subcategory_id
            , product_name
            , product_number
            , make_flag
            , finished_goods_flag
            , product_color
            , safety_stock_level
            , store_quantity
            , reorder_point
            , case
                when store_quantity > safety_stock_level then 'safe'
                when store_quantity > reorder_point then 'warning'
                else 'caution'
            end as inventory_status
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
            , product_subcategory_name
            , coalesce(product_category_name, 'Sem categoria') as product_category_name
            , product_model_id
            , sell_start_date
            , sell_end_date
            , discontinued_date
        from joins_product
    )

select *
from dim_product
