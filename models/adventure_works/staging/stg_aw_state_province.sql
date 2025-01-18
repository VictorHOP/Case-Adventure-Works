with
    source as (
        select 
            cast(stateprovinceid as int) as state_province_id,
            cast(stateprovincecode as varchar) as state_province_code,
            cast(countryregioncode as varchar) as country_region_code,
            cast(name as varchar) as state_province_name,
            cast(territoryid as int) as territory_id,
            cast(isonlystateprovinceflag as boolean) as is_only_state_province_flag,
            cast(rowguid as varchar) as row_guid,
            cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'stateprovince') }}
    )

select *
from source
