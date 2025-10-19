{{
    config(
        materialized = 'table'
        )
}}

with EMPLOYEE as (
    select
        employee_id as Employee_id,
        first_name as First_name,
        last_name as Last_name,
        CONCAT(first_name, ' ', last_name) as FULL_NAME,
        department as Department,
        salary as Salary, 
        hire_date as Hire_date,
        YEAR(hire_date) as YEAR,
        MONTH(hire_date) as MONTH,
        DAY(hire_date) as DAY,
        location as Location,
        split_part(location, '-', 2) as COUNTRY,
        split_part(location, '-', 1) as CITY
    from DBT_DB.PUBLIC.EMPLOYEE
)
select * from EMPLOYEE