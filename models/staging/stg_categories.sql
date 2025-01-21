SELECT 
    *
FROM
    {{ source("dataset_local_bike","categories")}}