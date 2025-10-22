{{ config(  materialized='incremental',
            incremental_strategy='delete+insert',
            unique_key='PRODUCT_ID' ) }}

with product_src as (
    select
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_PRICE,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
    from {{source('product','PRODUCT_SRC')}}

    {% if is_incremental() %}
    where CREATED_AT > (select max(INSERT_DTS) from {{this}})
    {% endif %}
)
select * from product_src