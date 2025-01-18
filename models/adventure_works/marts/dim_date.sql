with
    date_data as (
        select
            raw_date as date
            , year
            , month
            , day
            , week
        from {{ ref('stg_aw_date') }}
    )

    , dim_date as (
        select
            {{ 
                dbt_utils.generate_surrogate_key ([
                    'date'
                ]) 
            }} as date_sk
            , date
            , year
            , month
            , day
            , week
        from date_data
    )

select *
from dim_date
