{{ config(  materialized='incremental',
            incremental_strategy='merge',
            unique_key='PURCHASE_ID',
            merge_exclude_columns=['INSERT_DTS']    )}}

with purchase_src as (
    select
    PURCHASE_ID,
    PURCHASE_DATE,
    PURCHASE_STATUS,
    CREATED_AT,
    CURRENT_TIMESTAMP as INSERT_DTS,
    CURRENT_TIMESTAMP as UPDATE_DTS
    from {{source('purchase','PURCHASE_SRC')}}

    {% if is_incremental() %}
    where CREATED_AT > (select max(INSERT_DTS) from {{this}} )
    {% endif%}
)

select * from purchase_src