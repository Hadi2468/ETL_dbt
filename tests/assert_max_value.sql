select
    department,
    totalsalary
from {{ref('total_salary')}}
where totalsalary > 100000
