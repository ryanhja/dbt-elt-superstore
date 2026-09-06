{{
  config(
    materialized='incremental',
    unique_key='order_date',
    incremental_strategy='delete+insert'
  )
}}
with superstore as (
    select
        to_date(ss.order_date, 'MM/DD/YYYY') as order_date,
        sm.id as ship_id,
        to_date(ss.ship_date, 'MM/DD/YYYY') As ship_date,
        ss.customer_id,
        ss.product_id,
        ss.sales,
        ss.quantity,
        ss.discount,
        ss.profit
    from {{ ref("stg_superstore") }} ss
    join dim.dim_ship_mode sm
        on coalesce(ss.ship_mode, '') = coalesce(sm.ship_mode, '')
)
select
    order_date,
    ship_id,
    ship_date,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
from superstore
order by order_date