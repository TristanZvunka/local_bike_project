SELECT 
    CONCAT(order_id, '_', product_id) AS order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price AS retail_price,
    list_price * quantity AS total_amount,
    discount,
    (quantity * list_price * (1 - discount)) AS total_discount_amount
FROM
    {{ source("dataset_local_bike","order_items")}}