SELECT 
    order_id,
    store_id,
    customer_id,
    order_status,
    order_date,
    required_date AS expected_shipping_date,
    shipped_date AS order_shipped_at
FROM
    {{ source("dataset_local_bike","orders")}}