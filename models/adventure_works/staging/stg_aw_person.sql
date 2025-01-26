with
    raw_table as (
        select 
            cast(businessentityid as int) as business_entity_id
            , cast(persontype as varchar) as person_type
            , cast(namestyle as boolean) as name_style
            , cast(title as varchar) as title
            , cast(firstname as varchar) as first_name
            , cast(middlename as varchar) as middle_name
            , cast(lastname as varchar) as last_name
            , cast(emailpromotion as int) as email_promotion
            , cast(rowguid as varchar) as row_guid
            , cast(modifieddate as date) as modified_date
        from {{ source('adventureworks', 'person') }}
    )

    , concat_name as (
        select 
        /* Concatenate names to remove extra spaces between words */
            business_entity_id
            , person_type
            , name_style
            , title
            , first_name
            , middle_name
            , last_name
            ,concat(
                first_name,
                    CASE 
                        WHEN middle_name IS NOT NULL THEN ' ' || middle_name 
                        ELSE '' 
                    END,
                    ' ',
                    last_name
            ) as full_name
            , email_promotion
            , row_guid
            , modified_date
        from raw_table
    )

    , person_table as (
        select 
            business_entity_id
            , person_type
            , name_style
            , title
            , full_name
            , email_promotion
            , row_guid
            , modified_date
        from concat_name
    )

select *
from person_table
