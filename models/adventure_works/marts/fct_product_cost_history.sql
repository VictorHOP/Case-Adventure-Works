with
    product_cost_history_data as (
        select 
            product_id
            , start_date
            , end_date
            , standard_cost
        from {{ ref('stg_aw_product_cost_history') }}
    )

    , fct_product_cost_history as (
        select
            {{
                dbt_utils.generate_surrogate_key([
                    'product_id',
                    'start_date'
                ])
            }} as product_cost_history_sk,
            product_id,
            start_date,
            end_date,
            standard_cost,
        from product_cost_history_data
    )

select *
from fct_product_cost_history
