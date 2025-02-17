with
    source as (
        select
            cast(businessentityid as int) as business_entity_id
            , cast(nationalidnumber as int) as national_id
            , cast(loginid as varchar) as login_id
            , cast(jobtitle as varchar) as job_title
            , cast(birthdate as date) as birth_date
            , cast(maritalstatus as varchar) as marital_status
            , cast(gender as varchar) as gender
            , cast(hiredate as date) as hire_date
            , cast(salariedflag as boolean) as salaried_flag
            , cast(vacationhours as int) as vacation_hours
            , cast(sickleavehours as int) as sick_leave_hours
            , cast(currentflag as boolean) as current_flag
            , cast(modifieddate as date) as modified_date
            , cast(organizationnode as varchar) as organization_node
            , cast(rowguid as varchar) as row_guid
        from {{ source('adventureworks', 'employee') }}
    )

select *
from source
