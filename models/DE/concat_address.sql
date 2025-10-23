{{
    config
    (
        materialized = 'table'
    )
}}
select {{ DE_macro('123street','Chicago') }} as address