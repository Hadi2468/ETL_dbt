{{ config(materialized="table") }}

with
    employee_raw as (
        select
            employee_id as employee_id,
            first_name as first_name,
            last_name as last_name,
            concat(first_name, ' ', last_name) as full_name,
            department as department,
            salary as salary,
            hire_date as hire_date,
            year(hire_date) as year,
            month(hire_date) as month,
            day(hire_date) as day,
            location as location,
            split_part(location, '-', 2) as country,
            split_part(location, '-', 1) as city
        from {{ source("employee", "EMPLOYEE_RAW") }}  -- DBT_DB.PUBLIC.EMPLOYEE_RAW
    )
select *
from employee_raw
