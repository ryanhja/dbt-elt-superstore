with superstore as (
    select
        distinct
            country,
            city,
            state,
            postal_code,
            region
    from {{ ref("stg_superstore") }}
)
select
    ROW_NUMBER() OVER (ORDER BY country, region, state, city, postal_code) AS location_id,
    country,
    city,
    state,
    postal_code,
    region
from superstore