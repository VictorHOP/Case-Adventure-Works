with
    source as (
        select 
            cast(salesreasonid as int) as sales_reason_id
            , cast(name as varchar) as reason_name
            , cast(reasontype as varchar) as reason_type
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'salesreason') }}
    )

select *
from source
