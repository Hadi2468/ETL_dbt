select
    ID as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as status,
    AMOUNT / 100 as amount,
    CREATED as created_date
from {{ source("stripe", "STRIPE_PAYMENTS") }}  -- DBT_DB.JAFFLE_SHOP.STRIPE_PAYMENTS