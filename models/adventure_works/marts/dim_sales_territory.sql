with
    sales_territory_data as (
        select
            territory_id
            , territory_name
            , country_region_code
            , territory_group
            , sales_ytd
            , sales_last_year
            , cost_ytd
            , cost_last_year
        from {{ ref('stg_aw_sales_territory') }}
    )
    
    , dim_sales_territory as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'territory_id'
                ])
            }} as territory_sk
            , territory_id
            , territory_name
            , country_region_code
            , territory_group
            , sales_ytd
            , sales_last_year
            , cost_ytd
            , cost_last_year
        from sales_territory_data
    )

select *
from dim_sales_territory
