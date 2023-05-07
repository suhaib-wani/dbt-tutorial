with payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select order_id,
    sum(amount) as total_amount
    from payments
    group by 1
    having not(total_amount >= 0)
)

select * from final