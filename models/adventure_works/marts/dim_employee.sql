with
    dim_person as (
        select
            business_entity_id
            , person_sk
            , full_name
        from {{ ref('dim_person') }}
    )

    , employee_data as (
        select
            business_entity_id
            , national_id
            , login_id
            , job_title
            , birth_date
            , marital_status
            , gender
            , hire_date
            , salaried_flag
            , vacation_hours
            , sick_leave_hours
            , current_flag
            , modified_date
            , organization_node
            , row_guid
        from {{ ref('stg_aw_employee') }}
    )

    , dim_employee as (
        select
            {{
                dbt_utils.generate_surrogate_key([ 
                    'dim_person.business_entity_id'
                ])
            }} as employee_sk
            , dim_person.person_sk as person_fk
            , dim_person.business_entity_id
            , dim_person.full_name
            , national_id
            , login_id
            , job_title
            , birth_date
            , marital_status
            , gender
            , hire_date
            , salaried_flag
            , vacation_hours
            , sick_leave_hours
            , current_flag
            , modified_date
            , organization_node
            , row_guid
        from employee_data
        left join dim_person
            on dim_person.business_entity_id = employee_data.business_entity_id
    )

select *
from dim_employee
