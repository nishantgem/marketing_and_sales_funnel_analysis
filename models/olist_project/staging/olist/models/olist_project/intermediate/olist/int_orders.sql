with orders as (
    select *
    from {{ ref('stg_orders') }}
),

customers as (
    select *
    from {{ ref('stg_customers') }}
),

joined as (
    select
        o.order_id,
        o.customer_id,
        c.customer_unique_id,
        c.customer_city,
        c.customer_state,

        o.order_status,
        o.order_purchase_ts,
        o.order_approved_ts,

        o.order_carrier_delivered_ts,
        o.order_customer_delivered_ts,
        o.order_estimated_delivery_ts,

        extract(day from (o.order_customer_delivered_ts - o.order_purchase_ts)) as delivery_days
    from orders o
    left join customers c using (customer_id)
)

select * from joined
