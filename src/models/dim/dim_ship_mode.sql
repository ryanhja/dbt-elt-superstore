with superstore as (
    select
        distinct
            ship_mode
    from {{ ref("stg_superstore") }}
    where ship_mode is not null
)
select
    row_number() over (order by ship_mode) as id,
    ship_mode
from superstore