WITH order_item_grouped_by_order AS
(
SELECT order_id,
    sum(total_amount) as total_order_amount,
    sum(quantity) as total_items,
    count(distinct product_id) as total_distinct_items
FROM
    {{ ref('stg_order_items') }}
GROUP BY 
    order_id
),

store_by_order AS
( 
SELECT
    store_id,
    store_name,
    city,
    state
FROM
    {{ ref("stg_stores")}}
),

order_inv AS
(
SELECT
    order_id,
    store_id
FROM
    {{ ref("stg_orders")}}
)

SELECT
    o.order_id,
    o.total_order_amount,
    o.total_items,
    o.total_distinct_items,
    s.store_name,
    s.city,
    s.state
FROM 
    order_item_grouped_by_order AS o
LEFT JOIN 
    order_inv AS l 
ON
    l.order_id = o.order_id
LEFT JOIN 
    store_by_order AS s
ON 
    s.store_id = l.store_id