with
    employee_data as (
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
        from employee_data
    )

select *
from dim_employee
