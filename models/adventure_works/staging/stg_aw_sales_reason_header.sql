with
    source as (
        select 
            cast(salesorderid as int) as sales_order_id
            , cast(salesreasonid as int) as sales_reason_id
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'salesorderheadersalesreason') }}
    )

select *
from source
