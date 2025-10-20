select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from DBT_COURSE.JAFFLE_SHOP.JAFFLE_SHOP_ORDERS