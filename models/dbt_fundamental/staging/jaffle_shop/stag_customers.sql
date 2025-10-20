select
    id as customer_id,
    first_name,
    last_name

from {{ source("jaffle_shop", "JAFFLE_SHOP_CUSTOMERS") }} -- DBT_DB.JAFFLE_SHOP.JAFFLE_SHOP_CUSTOMERS