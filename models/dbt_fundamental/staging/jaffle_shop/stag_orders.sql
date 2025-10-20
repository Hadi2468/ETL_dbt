select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source("jaffle_shop", "JAFFLE_SHOP_ORDERS") }} -- DBT_DB.JAFFLE_SHOP.JAFFLE_SHOP_ORDERS