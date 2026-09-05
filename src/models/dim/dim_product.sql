with product as (
    select
        distinct
            product_id as id,
            category,
            subcategory,
            replace(product_name, E'\uFFFD', ' ') as product_name
    from {{ ref("stg_superstore") }}
    order by product_id
)
select
    id,
    category,
    subcategory,
    product_name
from product