{{
    config
    (
        materialized = 'table',
        schema = 'AGG'
    )
}}
select * from {{ ref('project2_mart') }} where name in ('abc')
