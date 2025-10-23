{{
    config
    (
        materialized = 'table'
    )
}}
select * from {{ ref('project1_bronze') }} where id = 1