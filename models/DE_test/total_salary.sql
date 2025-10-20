{{config(materialized='table')}}

with employee as (
    select * from {{ref('employee')}}
)

select
    department,
    sum(salary) as total_salary
from employee
groupBy department