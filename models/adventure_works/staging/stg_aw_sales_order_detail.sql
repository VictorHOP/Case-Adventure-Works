with
    source as (
        select 
            cast(salesorderid as int) as sales_order_id
            , cast(salesorderdetailid as int) as sales_order_detail_id
            , cast(carriertrackingnumber as varchar) as carrier_tracking_number
            , cast(orderqty as int) as order_qty
            , cast(productid as int) as product_id
            , cast(specialofferid as int) as special_offer_id
            , cast(unitprice as float) as unit_price
            , cast(unitpricediscount as float) as unit_price_discount
            , cast(rowguid as varchar) as row_guid
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'salesorderdetail') }}
    )

select *
from source
