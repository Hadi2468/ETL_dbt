{{ config(  materialized ='incremental',
            incremental_strategy = 'append' ) }}

with sales_src as (
    select
    SALE_ID,
    SALE_DATE,
    CUSTOMER_ID,
    PRODUCT_ID,
    QUANTITY,
    TOTAL_AMOUNT,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
    FROM {{source('sales','SALES_SRC')}}


    {% if is_incremental()%}
    where CREATED_AT > (SELECT MAX(INSERT_DTS) FROM {{this}})
    {% endif %}
)
SELECT * FROM sales_src