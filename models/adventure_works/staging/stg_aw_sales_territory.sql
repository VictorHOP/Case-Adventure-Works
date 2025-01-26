with
    source as (
        select 
            cast(territoryid as int) as territory_id
            , cast(name as varchar) as territory_name
            , cast(countryregioncode as varchar) as country_region_code
            , cast(territory_group as varchar) as territory_group
            , cast(salesytd as float) as sales_ytd
            , cast(saleslastyear as float) as sales_last_year
            , cast(costytd as float) as cost_ytd
            , cast(costlastyear as float) as cost_last_year
            , cast(rowguid as varchar) as row_guid
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'salesterritory') }}
    )

select *
from source
