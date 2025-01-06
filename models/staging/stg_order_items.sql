SELECT 
*
FROM
{{ source("dataset_local_bike","order_items")}}