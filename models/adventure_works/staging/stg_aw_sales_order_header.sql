with
    source as (
        select 
            cast(salesorderid as int) as sales_order_id
            , cast(revisionnumber as int) as revision_number
            , cast(orderdate as date) as order_date
            , cast(duedate as date) as due_date
            , cast(shipdate as date) as ship_date
            , cast(status as int) as status
            , cast(onlineorderflag as boolean) as online_order_flag
            , cast(purchaseordernumber as varchar) as purchase_order_number
            , cast(accountnumber as varchar) as account_number
            , cast(customerid as int) as customer_id
            , cast(salespersonid as int) as salesperson_id
            , cast(territoryid as int) as territory_id
            , cast(billtoaddressid as int) as bill_to_address_id
            , cast(shiptoaddressid as int) as ship_to_address_id
            , cast(shipmethodid as int) as ship_method_id
            , cast(creditcardid as int) as credit_card_id
            , cast(creditcardapprovalcode as varchar) as credit_card_approval_code
            , cast(currencyrateid as int) as currency_rate_id
            , cast(subtotal as float) as subtotal
            , cast(taxamt as float) as tax_amount
            , cast(freight as float) as freight
            , cast(totaldue as float) as total_due
            , cast(comment as int) as comment
            , cast(rowguid as varchar) as row_guid
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'salesorderheader') }}
    )

select *
from source
