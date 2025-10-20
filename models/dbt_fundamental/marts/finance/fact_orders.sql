with orders as (
    select * from {{ ref('stag_orders') }}
),

payments as ( 
    select * from {{ ref('stripe_payments') }}
),

final as (
    select
        orders.order_id,
        orders.user_id as customer_id,
        coalesce(payments.amount, 0)
    from orders
    left join payments using (order_id)
)

select * from final