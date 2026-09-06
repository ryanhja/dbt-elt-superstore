with customer as (
    select
        distinct
            ss.customer_id,
            ss.customer_name,
            lc.id as location_id,
            ss.segment
    from {{ ref('stg_superstore') }} ss
    join {{ ref("dim_location") }} lc
        on coalesce(ss.country, '') = coalesce(lc.country, '')
        and coalesce(ss.region, '') = coalesce(lc.region, '')
        and coalesce(ss.state, '') = coalesce(lc.state, '')
        and coalesce(ss.city, '') = coalesce(lc.city, '')
        and coalesce(ss.postal_code, 0) = coalesce(lc.postal_code, 0)
)
select
    customer_id as id,
    customer_name,
    segment,
    location_id
from customer
order by customer_id