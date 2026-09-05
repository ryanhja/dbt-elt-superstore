with superstore as (
    select
        cast(to_char(to_date(ss.order_date, 'MM/DD/YYYY'), 'YYYYMMDD') as int) as fk_date,
        ss.customer_id,
        dl.location_id,
        ss.product_id
    from {{ ref("stg_superstore") }} ss
    inner join {{ ref("dim_location") }} dl on
        COALESCE(ss.country, '') = COALESCE(dl.country, '') AND
        COALESCE(ss.region, '') = COALESCE(dl.region, '') AND
        COALESCE(ss.state, '') = COALESCE(dl.state, '') AND
        COALESCE(ss.city, '') = COALESCE(dl.city, '') AND
        COALESCE(ss.postal_code, 0) = COALESCE(dl.postal_code, 0)
)
select
    fk_date,
    customer_id,
    location_id,
    product_id
from superstore