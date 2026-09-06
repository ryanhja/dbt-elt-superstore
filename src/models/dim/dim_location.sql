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
    row_number() over (order by  country, region, state, city, postal_code) as id,
    country,
    city,
    state,
    postal_code,
    region
from superstore