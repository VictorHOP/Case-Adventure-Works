with
    address_data as (
        select
            address_id
            , address_line_1
            , address_line_2
            , city
            , state_province_id
            , postal_code
        from {{ ref('stg_aw_address') }}
    )

    , state_province_data as (
        select
            state_province_id
            , state_province_code
            , country_region_code
            , state_province_name
            , territory_id
            , is_only_state_province_flag
        from {{ ref('stg_aw_state_province') }}
    )

    , dim_address as (
        select
            {{
                dbt_utils.generate_surrogate_key([
                    'address_id'
                ])
            }} as address_sk
            , address_data.address_id
            , address_data.address_line_1
            , address_data.address_line_2
            , address_data.city
            , address_data.state_province_id
            , address_data.postal_code
            , state_province_data.state_province_code
            , state_province_data.country_region_code
            , state_province_data.state_province_name
            , state_province_data.territory_id
            , state_province_data.is_only_state_province_flag
        from address_data
        left join state_province_data
            on address_data.state_province_id = state_province_data.state_province_id
    )

select *
from dim_address
