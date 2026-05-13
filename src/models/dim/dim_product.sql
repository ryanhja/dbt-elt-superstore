with product as (
    select * from {{ ref("stg_superstore") }}
)
select * from product