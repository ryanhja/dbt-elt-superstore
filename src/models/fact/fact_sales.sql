with superstore as (
    select
        to_char(to_date(order_date, 'MM/DD/YYYY'), 'YYYYMMDD')::INT AS fk_date,
        customer_id,

    from {{ ref("stg_superstore") }}
)
select * from superstore