with
    person_data as (
        select 
            business_entity_id
            , person_type
            , name_style
            , title
            , full_name
            , email_promotion
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
        from person_data
    )

select *
from dim_person
