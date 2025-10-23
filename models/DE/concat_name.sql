{{
    config(
        materialized='table'
    )
}}


select {{ DE_macro('John','Smith') }} as name