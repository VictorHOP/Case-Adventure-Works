with
    person_data as (
        select 
            business_entity_id
            , person_type
            , name_style
            , title
            , full_name
            , email_promotion
            , row_guid
            , modified_date
        from {{ ref('stg_aw_person') }}
    )

    , dim_person as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'business_entity_id'
                ])
            }} as person_sk
            , business_entity_id
            , person_type
            , name_style
            , title
            , full_name
            , email_promotion
            , row_guid
            , modified_date
        from person_data
    )

select *
from dim_person
