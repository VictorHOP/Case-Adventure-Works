with
    source as (
        select 
            cast(addressid as int) as address_id,
            cast(addressline1 as varchar) as address_line_1,
            cast(addressline2 as varchar) as address_line_2,
            cast(city as varchar) as city,
            cast(stateprovinceid as int) as state_province_id,
            cast(postalcode as varchar) as postal_code,
            cast(rowguid as varchar) as row_guid,
            cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'address') }}
    )

select *
from source
