{{ config(materialized='view') }}

select * from {{ ref('customer') }}
where COUNTRY ='USA'