{{config(materialized='table')}}

with employee as (
    select * from {{ref('employee')}}
)

select
    department,
    sum(salary) as totalsalary
from employee
group By department