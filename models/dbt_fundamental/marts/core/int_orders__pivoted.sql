{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with payments as (
    select *
    from {{ ref('stripe_payments') }}  -- DBT_DB.JAFFLE_SHOP.STRIPE_PAYMENTS
), 
final as (
    select 
        order_id,
        {%- for pm in payment_methods -%}
            sum(case when payment_method = '{{ pm }}' then amount else 0 end) as amount_{{ pm }}
            {%- if not loop.last -%} , {% endif %}
        {% endfor %}
    from payments
    where status = 'success' 
    group by 1
)

select * from final